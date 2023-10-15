import '../../../../src.export.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  @override
  Future<ValidResponse> getCurrencies() async {
    final localData = await locator.get<CurrencyLocalDatasource>().fetchData();
    if(localData.statusCode?.successResponse() ?? false) {
      return localData;
    } else {
      return await locator.get<CurrencyRemoteDatasource>().fetchData();
    }
  }
}
