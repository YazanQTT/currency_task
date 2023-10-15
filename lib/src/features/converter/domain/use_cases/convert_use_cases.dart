import '../../../../src.export.dart';

class ConvertUseCases {
  Future<ValidResponse> execute(String fCurrencyCode, String tCurrencyCode) async {
    return await locator.get<ConvertRepository>().convertCurrencies(fCurrencyCode, tCurrencyCode);
  }
}