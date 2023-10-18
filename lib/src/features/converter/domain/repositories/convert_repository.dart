import 'package:dartz/dartz.dart';

import '../../../../src.export.dart';

abstract class ConvertRepository {
  Future<Either<Failure, ValidResponse>> convertCurrencies(String fCurrencyCode, String tCurrencyCode);
}