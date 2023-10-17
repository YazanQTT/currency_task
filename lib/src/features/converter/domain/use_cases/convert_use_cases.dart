import 'package:injectable/injectable.dart';
import 'package:mockito/annotations.dart';

import '../../../../core/injection/inj.dart';
import '../../../../src.export.dart';
import 'convert_use_cases.mocks.dart';

abstract class ConvertUseCases {
  Future<ValidResponse> execute(String fCurrencyCode, String tCurrencyCode);
}


@dev
@LazySingleton(as: ConvertUseCases)
class ConvertUseCasesImpl implements ConvertUseCases {
  @override
  Future<ValidResponse> execute(String fCurrencyCode, String tCurrencyCode) async {
    return await getIt.get<ConvertRepository>().convertCurrencies(fCurrencyCode, tCurrencyCode);
  }
}

@test
@LazySingleton(as: ConvertUseCases)
@GenerateMocks([ConvertUseCases])
class MockConvertUseCasesImpl extends MockConvertUseCases implements ConvertUseCases {}