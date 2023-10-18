import 'package:dartz/dartz.dart';

import '../../../../src.export.dart';

abstract class HistoricRepository {
  Future<Either<Failure, ValidResponse>> getHistoricData();
}