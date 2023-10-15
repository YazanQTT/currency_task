import '../../../../src.export.dart';

abstract class CurrencyLocalDatasource {
  Future<ValidResponse> fetchData();

  Future<bool> insertData(List<CurrencyModel> currencies);
}
