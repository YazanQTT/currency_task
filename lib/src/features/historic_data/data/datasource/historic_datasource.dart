import '../../../../src.export.dart';

abstract class HistoricDatasource {
  Future<ValidResponse> getHistoricData();
}

