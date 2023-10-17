import 'package:injectable/injectable.dart';

import '../../../../core/injection/inj.dart';
import '../../../../src.export.dart';

@LazySingleton(as: CurrencyRemoteDatasource)
class CurrencyRemoteDatasourceImpl implements CurrencyRemoteDatasource {
  @override
  Future<ValidResponse> fetchData() async {

    final result = await getIt.get<NetworkService>().get(
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
    await getIt.get<SqfliteService>().insertData(data);
    result.data = data;

    return result;
  }
}
