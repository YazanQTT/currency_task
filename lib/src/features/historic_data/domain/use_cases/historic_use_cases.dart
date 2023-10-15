import 'package:currency_task/src/src.export.dart';

class HistoricUseCases {
  Future<ValidResponse> execute() async {
    return await locator.get<HistoricRepository>().getHistoricData();
  }
}