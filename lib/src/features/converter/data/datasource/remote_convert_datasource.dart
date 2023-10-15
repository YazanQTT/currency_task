import '../../../../src.export.dart';

class RemoteConvertDatasource implements ConvertDatasource {
  @override
  Future<ValidResponse> convertCurrencies(String fCurrencyCode, tCurrencyCode) async {
    final result = await locator.get<NetworkService>().get(
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
