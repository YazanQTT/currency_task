import 'package:bloc_test/bloc_test.dart';
import 'package:currency_task/src/src.export.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'currencies_bloc_test.mocks.dart';

@GenerateMocks([CurrencyUseCases])
void main() {
  initLocator();

  group('CurrencyBloc', () {
    late CurrencyBloc currencyBloc;
    late MockCurrencyUseCases currencyUseCases;

    setUp(() {
      currencyUseCases = MockCurrencyUseCases();
      currencyBloc = CurrencyBloc(currencyUseCases: currencyUseCases);
    });

    tearDown(() => currencyBloc.close());

    test('Initial state is correct', () {
      expect(currencyBloc.state, const CurrencyState());
    });

    blocTest(
      'emits [Loading, Success] when GetCurrenciesEvent is added',
      build: () {
        when(currencyUseCases.execute()).thenAnswer((_) async {
          return ValidResponse(
            data: [
              const CurrencyModel(
                code: 'USD',
                id: 'usd',
                name: 'US Dollar',
                symbol: '\$',
              ),
            ],
            statusCode: 200,
          );
        });
        return currencyBloc;
      },
      act: (_) => currencyBloc.add(GetCurrenciesEvent()),
      expect: () => [
        const CurrencyState(status: CurrencyStateStatus.LOADING, currencyList: []),
        const CurrencyState(
          status: CurrencyStateStatus.SUCCESS,
          currencyList: [
            CurrencyModel(
              code: 'USD',
              id: 'usd',
              name: 'US Dollar',
              symbol: '\$',
            ),
          ],
        ),
      ],
    );

    blocTest(
      'emits [Loading, Error] when GetCurrenciesEvent results in an error',
      build: () {
        when(currencyUseCases.execute()).thenAnswer((_) async {
          return ValidResponse(statusCode: 500);
        });
        return currencyBloc;
      },
      act: (_) => currencyBloc.add(GetCurrenciesEvent()),
      expect: () => [
        const CurrencyState(
            status: CurrencyStateStatus.LOADING, currencyList: []),
        const CurrencyState(
          status: CurrencyStateStatus.ERROR,
          currencyList: [],
        ),
      ],
    );
  });
}
