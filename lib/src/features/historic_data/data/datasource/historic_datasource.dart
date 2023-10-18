import 'package:dartz/dartz.dart';

import '../../../../src.export.dart';

abstract class HistoricDatasource {
  Future<Either<Failure, ValidResponse>> getHistoricData();
}

