import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../../core/injection/inj.dart';
import '../../../../src.export.dart';

@LazySingleton(as: HistoricDatasource)
class RemoteHistoricDatasourceImpl implements HistoricDatasource {
  @override
  Future<Either<Failure, ValidResponse>> getHistoricData() async {
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final startDate = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(const Duration(days: 7)));

    final result = await getIt.get<NetworkService>().get(
      baseUrl: NetworkConstants.baseUrl,
      path: '/api/v7/convert',
      params: {
        'apiKey': NetworkConstants.apiKey,
        'q': 'GBP_USD,EUR_USD',
        'compact': 'ultra',
        'date': startDate,
        'endDate': today,
      },
    );

    return result;
  }
}
