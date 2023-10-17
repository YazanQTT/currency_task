import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../src.export.dart';

abstract class NetworkService {
  Future<ValidResponse> get({
    required String baseUrl,
    String path,
    Map<String, String>? headers,
    Map<String, dynamic>? params = const {},
  });
}

@LazySingleton(as: NetworkService)
class NetworkServiceImpl implements NetworkService {
  @override
  Future<ValidResponse> get({
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
      return ValidResponse(
        statusCode: response.statusCode,
        data: json.decode(str),
        message: data['message'] ?? '',
      );
    } on SocketException catch (e) {
      return ValidResponse(
        statusCode: 500,
        data: 'Check internet connection',
        message: e.message,
      );
    } on ValidResponse catch (e) {
      return ValidResponse(
        statusCode: e.statusCode,
        data: e.data,
        message: e.message,
      );
    } on Exception catch (e) {
      return ValidResponse(
        statusCode: 500,
        message: e.toString(),
      );
    }
  }
}
