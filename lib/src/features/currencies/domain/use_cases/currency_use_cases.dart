import 'package:currency_task/src/src.export.dart';

class CurrencyUseCases {
  Future<ValidResponse> execute() async {
    return await locator.get<CurrencyRepository>().getCurrencies();
  }
}
