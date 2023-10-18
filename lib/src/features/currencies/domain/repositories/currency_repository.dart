import 'package:currency_task/src/src.export.dart';
import 'package:dartz/dartz.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, ValidResponse>> getCurrencies();
}
