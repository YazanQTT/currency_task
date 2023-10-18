import 'package:dartz/dartz.dart';

import '../../../../src.export.dart';

abstract class ConvertDatasource {
  Future<Either<Failure, ValidResponse>> convertCurrencies(String fCurrencyCode, tCurrencyCode);
}