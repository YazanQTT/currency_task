import 'package:currency_task/src/core/injection/inj.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../src.export.dart';

@LazySingleton(as: ConvertDatasource)
class RemoteConvertDatasource implements ConvertDatasource {
  @override
  Future<Either<Failure, ValidResponse>> convertCurrencies(String fCurrencyCode, tCurrencyCode) async {

    final result = await getIt.get<NetworkService>().get(
      baseUrl: NetworkConstants.baseUrl,
      path: '/api/v7/convert',
      params: {
        'q': '${fCurrencyCode}_$tCurrencyCode',
        'compact': 'ultra',
        'apiKey': NetworkConstants.apiKey,
      },
    );

    return result;
  }
}
