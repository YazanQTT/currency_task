import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/injection/inj.dart';
import '../../../../src.export.dart';

@LazySingleton(as: CurrencyRemoteDatasource)
class CurrencyRemoteDatasourceImpl implements CurrencyRemoteDatasource {
  @override
  Future<Either<Failure, ValidResponse>> fetchData() async {

    final result = await getIt.get<NetworkService>().get(
      baseUrl: NetworkConstants.baseUrl,
      path: '/api/v7/currencies',
      params: {
        'apiKey': NetworkConstants.apiKey,
      },
    );

    result.fold((l) {
      return result;
    }, (r) async {
      final responseData = r.data['results'] as Map<String, dynamic>;

      final data = responseData.entries
          .map((e) => CurrencyModel.fromJson(e.value))
          .toList();
      await getIt.get<SqfliteService>().insertData(data);

      r.data = data;
      return result;
    });
    return result;
  }
}
