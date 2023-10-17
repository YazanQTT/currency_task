import 'package:currency_task/src/src.export.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/annotations.dart';

import '../../../../core/injection/inj.dart';
import 'historic_use_cases.mocks.dart';

abstract class HistoricUseCases {
  Future<ValidResponse> execute();
}

@dev
@LazySingleton(as: HistoricUseCases)
class HistoricUseCasesImpl implements HistoricUseCases {
  @override
  Future<ValidResponse> execute() async {
    return await getIt.get<HistoricRepository>().getHistoricData();
  }
}

@test
@LazySingleton(as: HistoricUseCases)
@GenerateMocks([HistoricUseCases])
class MockHistoricUseCasesImpl extends MockHistoricUseCases implements HistoricUseCases {}