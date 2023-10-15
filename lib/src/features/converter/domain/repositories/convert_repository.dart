import '../../../../src.export.dart';

abstract class ConvertRepository {
  Future<ValidResponse> convertCurrencies(String fCurrencyCode, String tCurrencyCode);
}