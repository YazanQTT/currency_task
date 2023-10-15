import '../../../../src.export.dart';

abstract class HistoricRepository {
  Future<ValidResponse> getHistoricData();
}