import 'package:currency_task/src/core/injection/inj.dart';
import 'package:injectable/injectable.dart';

import '../../../../src.export.dart';

@LazySingleton(as: CurrencyRepository)
class CurrencyRepositoryImpl implements CurrencyRepository {
  @override
  Future<ValidResponse> getCurrencies() async {
    final localData = await getIt.get<CurrencyLocalDatasource>().fetchData();
    if(localData.statusCode?.successResponse() ?? false) {
      return localData;
    } else {
      return await getIt.get<CurrencyRemoteDatasource>().fetchData();
    }
  }
}
