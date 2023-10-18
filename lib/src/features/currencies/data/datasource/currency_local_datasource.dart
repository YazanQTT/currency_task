import 'package:dartz/dartz.dart';

import '../../../../src.export.dart';

abstract class CurrencyLocalDatasource {
  Future<Either<Failure, ValidResponse>> fetchData();

  Future<bool> insertData(List<CurrencyModel> currencies);
}
