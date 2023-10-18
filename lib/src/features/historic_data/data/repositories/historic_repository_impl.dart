import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/injection/inj.dart';
import '../../../../src.export.dart';

@LazySingleton(as: HistoricRepository)
class HistoricRepositoryImpl implements HistoricRepository {
  @override
  Future<Either<Failure, ValidResponse>> getHistoricData() async {
    return await getIt.get<HistoricDatasource>().getHistoricData();
  }
}
