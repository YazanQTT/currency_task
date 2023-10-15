import '../../../../src.export.dart';

abstract class ConvertDatasource {
  Future<ValidResponse> convertCurrencies(String fCurrencyCode, tCurrencyCode);
}