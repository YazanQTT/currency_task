import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../src.export.dart';

abstract class NetworkService {
  Future<Either<Failure, ValidResponse>> get({
    required String baseUrl,
    String path,
    Map<String, String>? headers,
    Map<String, dynamic>? params = const {},
  });
}

@LazySingleton(as: NetworkService)
class NetworkServiceImpl implements NetworkService {
  @override
  Future<Either<Failure, ValidResponse>> get({
    required String baseUrl,
    String path = '',
    Map<String, String>? headers,
    Map<String, dynamic>? params = const {},
  }) async {
    try {
      final uri = Uri.https(baseUrl, path, params);
      if (!uri.isAbsolute) throw Exception('Not valid URL');
      final response = await http.get(uri, headers: headers);
      final data = jsonDecode(response.body);
      final str = utf8.decode(response.bodyBytes);
      return Right(
        ValidResponse(
          statusCode: response.statusCode,
          data: json.decode(str),
          message: data['message'] ?? '',
        ),
      );
    } on SocketException catch (e) {
      return Left(Failure(statusCode: 500, message: e.message));
    } on ValidResponse catch (e) {
      return Right(ValidResponse(statusCode: e.statusCode, data: e.data, message: e.message));
    } on Exception catch (e) {
      return Left(Failure(statusCode: 500, message: e.toString()));
    }
  }
}
