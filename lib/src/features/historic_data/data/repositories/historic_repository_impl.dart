import '../../../../src.export.dart';

class HistoricRepositoryImpl implements HistoricRepository {
  @override
  Future<ValidResponse> getHistoricData() async {
    return await locator.get<HistoricDatasource>().getHistoricData();
  }
}
