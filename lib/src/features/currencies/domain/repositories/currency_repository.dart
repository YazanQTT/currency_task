import 'package:currency_task/src/src.export.dart';

abstract class CurrencyRepository {
  Future<ValidResponse> getCurrencies();
}
