import '../../../../src.export.dart';

class ConvertRepositoryImpl implements ConvertRepository {
  @override
  Future<ValidResponse> convertCurrencies(String fCurrencyCode, String tCurrencyCode) async {
    return await locator.get<ConvertDatasource>().convertCurrencies(fCurrencyCode, tCurrencyCode);
  }
}