import 'package:injectable/injectable.dart';

import '../../../../core/injection/inj.dart';
import '../../../../src.export.dart';

@LazySingleton(as: CurrencyLocalDatasource)
class CurrencyLocalDatasourceImpl implements CurrencyLocalDatasource {

  @override
  Future<ValidResponse> fetchData() async {
    final data = await getIt.get<SqfliteService>().getData();
    if (data.isNotEmpty) {
      final responseData = data.map((map) => CurrencyModel.fromJson(map)).toList();
      return ValidResponse(statusCode: 200, data: responseData);
    } else {
      return ValidResponse(statusCode: 500);
    }
  }

  @override
  Future<bool> insertData(List<CurrencyModel> currencies) async {
    return await getIt.get<SqfliteService>().insertData(currencies);
  }
}
