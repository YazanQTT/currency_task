import '../../../../src.export.dart';

class RemoteDataSourceImpl implements CurrencyRemoteDatasource {
  @override
  Future<ValidResponse> fetchData() async {
    final result = await locator.get<NetworkService>().get(
      baseUrl: NetworkConstants.baseUrl,
      path: '/api/v7/currencies',
      params: {
        'apiKey': NetworkConstants.apiKey,
      },
    );

    final responseData = result.data['results'] as Map<String, dynamic>;
    final data = responseData.entries
        .map((e) => CurrencyModel.fromJson(e.value))
        .toList();
    await locator.get<SqfliteService>().insertData(data);
    result.data = data;

    return result;
  }
}
