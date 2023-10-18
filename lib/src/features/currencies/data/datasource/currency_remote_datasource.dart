import 'package:dartz/dartz.dart';

import '../../../../src.export.dart';

abstract class CurrencyRemoteDatasource {
  Future<Either<Failure, ValidResponse>> fetchData();
}


