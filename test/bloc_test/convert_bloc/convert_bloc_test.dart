import 'package:bloc_test/bloc_test.dart';
import 'package:currency_task/src/core/injection/inj.dart';
import 'package:currency_task/src/src.export.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  configureDependencies(env: ValueConstants.test);

  group('ConvertBloc', () {
    late ConverterBloc converterBloc;
    late MockConvertUseCasesImpl convertUseCases;

    setUp(() {
      convertUseCases = getIt.get<ConvertUseCases>() as MockConvertUseCasesImpl;
      converterBloc = ConverterBloc();
    });

    tearDown(() => converterBloc.close());

    test('Initial state is correct', () {
      expect(converterBloc.state, const ConverterState());
    });

    blocTest(
      'emits [ConverterState] when FromCurrencyEvent is added, and adds Currency to fromCurrency',
      build: () => converterBloc,
      act: (_) => converterBloc.add(
        FromCurrencyEvent(
          const CurrencyModel(
              code: 'JPY', symbol: '-', name: 'Japan yen', id: '-'),
        ),
      ),
      expect: () => [
        const ConverterState(
          fromCurrencySelected: true,
          fromCurrency: CurrencyModel(
            code: 'JPY',
            symbol: '-',
            name: 'Japan yen',
            id: '-',
          ),
        ),
      ],
    );

    blocTest(
      'emits [ConverterState] when ToCurrencyEvent is added, and adds Currency to toCurrency',
      build: () => converterBloc,
      act: (_) => converterBloc.add(
        ToCurrencyEvent(
          const CurrencyModel(
            code: 'JOD',
            symbol: '\$',
            name: 'Jordanian Dinar',
            id: '-',
          ),
        ),
      ),
      expect: () => [
        const ConverterState(
          toCurrencySelected: true,
          toCurrency: CurrencyModel(
            code: 'JOD',
            symbol: '\$',
            name: 'Jordanian Dinar',
            id: '-',
          ),
        ),
      ],
    );

    blocTest(
      'emits [ConverterState] when SwapCurrencyEvent is added, and swaps Currencies in states (seed with canSwapCurrencies => true)',
      build: () => converterBloc,
      act: (_) => converterBloc.add(
        SwapCurrencyEvent(
          const CurrencyModel(
            code: 'JOD',
            symbol: '\$',
            name: 'Jordanian Dinar',
            id: '-',
          ),
          const CurrencyModel(
            code: 'USD',
            symbol: '\$',
            name: 'United States Dollar',
            id: '-',
          ),
        ),
      ),
      seed: () => const ConverterState(canSwapCurrencies: true),
      expect: () => [
        const ConverterState(
          fromCurrencySelected: true,
          toCurrencySelected: true,
          canSwapCurrencies: true,
          toCurrency: CurrencyModel(
            code: 'JOD',
            symbol: '\$',
            name: 'Jordanian Dinar',
            id: '-',
          ),
          fromCurrency: CurrencyModel(
            code: 'USD',
            symbol: '\$',
            name: 'United States Dollar',
            id: '-',
          ),
        ),
      ],
    );

    blocTest(
      'emits [LOADING, SUCCESS] when ConvertCurrenciesEvent is added, and adds [result, exchangeRate] => FromCurrency != ToCurrency',
      build: () {
        when(convertUseCases.execute('JOD', 'USD')).thenAnswer((_) async {
          return ValidResponse(
            data: {"JOD_USD": 1.41},
            statusCode: 200,
          );
        });

        return converterBloc;
      },
      act: (_) => converterBloc.add(
        ConvertCurrenciesEvent(
          fromCurrency: const CurrencyModel(
            code: 'JOD',
            symbol: '\$',
            name: 'Jordanian Dinar',
            id: '-',
          ),
          toCurrency: const CurrencyModel(
            code: 'USD',
            symbol: '\$',
            name: 'United States Dollar',
            id: '-',
          ),
          amount: '100',
        ),
      ),
      seed: () => const ConverterState(
        canSwapCurrencies: true,
        fromCurrencySelected: true,
        toCurrencySelected: true,
        amount: '100',
        fromCurrency: CurrencyModel(
          code: 'JOD',
          symbol: '\$',
          name: 'Jordanian Dinar',
          id: '-',
        ),
        toCurrency: CurrencyModel(
          code: 'USD',
          symbol: '\$',
          name: 'United States Dollar',
          id: '-',
        ),
      ),
      expect: () => [
        const ConverterState(
          convertStateStatus: ConvertStateStatus.LOADING,
          fromCurrencySelected: true,
          toCurrencySelected: true,
          canSwapCurrencies: true,
          amount: '100',
          fromCurrency: CurrencyModel(
            code: 'JOD',
            symbol: '\$',
            name: 'Jordanian Dinar',
            id: '-',
          ),
          toCurrency: CurrencyModel(
            code: 'USD',
            symbol: '\$',
            name: 'United States Dollar',
            id: '-',
          ),
        ),
        const ConverterState(
          fromCurrencySelected: true,
          toCurrencySelected: true,
          canSwapCurrencies: true,
          converted: true,
          fromCurrency: CurrencyModel(
            code: 'JOD',
            symbol: '\$',
            name: 'Jordanian Dinar',
            id: '-',
          ),
          toCurrency: CurrencyModel(
            code: 'USD',
            symbol: '\$',
            name: 'United States Dollar',
            id: '-',
          ),
          result: '141.0000',
          exchangeRate: '1.4100',
          amount: '100',
          convertStateStatus: ConvertStateStatus.SUCCESS,
        ),
      ],
    );

    blocTest(
      'emits [LOADING, SUCCESS] when ConvertCurrenciesEvent is added, and adds [result = amount, exchangeRate = 1] => FromCurrency == ToCurrency',
      build: () => converterBloc,
      act: (_) => converterBloc.add(
        ConvertCurrenciesEvent(
          fromCurrency: const CurrencyModel(
            code: 'JOD',
            symbol: '\$',
            name: 'Jordanian Dinar',
            id: '-',
          ),
          toCurrency: const CurrencyModel(
            code: 'JOD',
            symbol: '\$',
            name: 'Jordanian Dinar',
            id: '-',
          ),
          amount: '100',
        ),
      ),
      seed: () => const ConverterState(
        canSwapCurrencies: true,
        fromCurrencySelected: true,
        toCurrencySelected: true,
        amount: '100',
        fromCurrency: CurrencyModel(
          code: 'JOD',
          symbol: '\$',
          name: 'Jordanian Dinar',
          id: '-',
        ),
        toCurrency: CurrencyModel(
          code: 'JOD',
          symbol: '\$',
          name: 'Jordanian Dinar',
            id: '-',
        ),
      ),
      expect: () => [
        const ConverterState(
          convertStateStatus: ConvertStateStatus.LOADING,
          fromCurrencySelected: true,
          toCurrencySelected: true,
          canSwapCurrencies: true,
          amount: '100',
          fromCurrency: CurrencyModel(
            code: 'JOD',
            symbol: '\$',
            name: 'Jordanian Dinar',
            id: '-',
          ),
          toCurrency: CurrencyModel(
            code: 'JOD',
            symbol: '\$',
            name: 'Jordanian Dinar',
            id: '-',
          ),
        ),
        const ConverterState(
          fromCurrencySelected: true,
          toCurrencySelected: true,
          canSwapCurrencies: true,
          converted: true,
          fromCurrency: CurrencyModel(
            code: 'JOD',
            symbol: '\$',
            name: 'Jordanian Dinar',
            id: '-',
          ),
          toCurrency: CurrencyModel(
            code: 'JOD',
            symbol: '\$',
            name: 'Jordanian Dinar',
            id: '-',
          ),
          result: '100',
          exchangeRate: '1',
          amount: '100',
          convertStateStatus: ConvertStateStatus.SUCCESS,
        ),
      ],
    );

    blocTest(
      'emits [LOADING, ERROR] when ConvertCurrenciesEvent is added, and results in an error',
      build: () {
        when(convertUseCases.execute('JOD', 'USD')).thenAnswer((_) async {
          return ValidResponse(
            statusCode: 500,
          );
        });

        return converterBloc;
      },
      act: (_) => converterBloc.add(
        ConvertCurrenciesEvent(
          fromCurrency: const CurrencyModel(
            code: 'JOD',
            symbol: '\$',
            name: 'Jordanian Dinar',
            id: '-',
          ),
          toCurrency: const CurrencyModel(
            code: 'JOD',
            symbol: '\$',
            name: 'Jordanian Dinar',
            id: '-',
          ),
          amount: '100',
        ),
      ),
      seed: () => const ConverterState(
        canSwapCurrencies: true,
        fromCurrencySelected: true,
        toCurrencySelected: true,
        amount: '100',
        fromCurrency: CurrencyModel(
          code: 'JOD',
          symbol: '\$',
          name: 'Jordanian Dinar',
          id: '-',
        ),
        toCurrency: CurrencyModel(
          code: 'USD',
          symbol: '\$',
          name: 'United States Dollar',
          id: '-',
        ),
      ),
      expect: () => [
        const ConverterState(
          convertStateStatus: ConvertStateStatus.LOADING,
          fromCurrencySelected: true,
          toCurrencySelected: true,
          canSwapCurrencies: true,
          amount: '100',
          fromCurrency: CurrencyModel(
            code: 'JOD',
            symbol: '\$',
            name: 'Jordanian Dinar',
            id: '-',
          ),
          toCurrency: CurrencyModel(
            code: 'USD',
            symbol: '\$',
            name: 'United States Dollar',
            id: '-',
          ),
        ),
        const ConverterState(
          fromCurrencySelected: true,
          toCurrencySelected: true,
          canSwapCurrencies: true,
          fromCurrency: CurrencyModel(
            code: 'JOD',
            symbol: '\$',
            name: 'Jordanian Dinar',
            id: '-',
          ),
          toCurrency: CurrencyModel(
            code: 'USD',
            symbol: '\$',
            name: 'United States Dollar',
            id: '-',
          ),
          amount: '100',
          convertStateStatus: ConvertStateStatus.ERROR,
        ),
      ],
    );
  });
}
