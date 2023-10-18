import 'package:currency_task/src/core/injection/inj.dart';
import 'package:currency_task/src/src.export.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/annotations.dart';

import 'currency_use_cases.mocks.dart';

abstract class CurrencyUseCases {
  Future<Either<Failure, ValidResponse>> execute();
}

@dev
@LazySingleton(as: CurrencyUseCases)
class CurrencyUseCasesImpl implements CurrencyUseCases {
  @override
  Future<Either<Failure, ValidResponse>> execute() async {
    return await getIt.get<CurrencyRepository>().getCurrencies();
  }
}

@test
@LazySingleton(as: CurrencyUseCases)
@GenerateMocks([CurrencyUseCases])
class MockCurrencyUseCasesImpl extends MockCurrencyUseCases implements CurrencyUseCases {}
