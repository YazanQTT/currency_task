import '../../../../src.export.dart';

abstract class CurrencyRemoteDatasource {
  Future<ValidResponse> fetchData();
}


