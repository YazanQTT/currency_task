import '../../../../src.export.dart';

enum ConvertStateStatus { INITIAL, LOADING, ERROR, SUCCESS }

class ConverterState extends Equatable {
  final bool fromCurrencySelected;
  final bool toCurrencySelected;
  final CurrencyModel? fromCurrency;
  final CurrencyModel? toCurrency;
  final String result;
  final String exchangeRate;
  final String amount;
  final bool converted;
  final bool canSwapCurrencies;
  final ConvertStateStatus convertStateStatus;

  const ConverterState({
    this.fromCurrencySelected = false,
    this.toCurrencySelected = false,
    this.fromCurrency,
    this.toCurrency,
    this.result = '',
    this.exchangeRate = '',
    this.amount = '',
    this.converted = false,
    this.canSwapCurrencies = false,
    this.convertStateStatus = ConvertStateStatus.INITIAL,
  });

  ConverterState copyWith({
    bool? fromCurrencySelected,
    bool? toCurrencySelected,
    CurrencyModel? fromCurrency,
    CurrencyModel? toCurrency,
    String? result,
    String? exchangeRate,
    String? amount,
    bool? converted,
    bool? canSwapCurrencies,
    ConvertStateStatus? convertStateStatus,
  }) {
    return ConverterState(
      fromCurrencySelected: fromCurrencySelected ?? this.fromCurrencySelected,
      toCurrencySelected: toCurrencySelected ?? this.toCurrencySelected,
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,
      result: result ?? this.result,
      exchangeRate: exchangeRate ?? this.exchangeRate,
      amount: amount ?? this.amount,
      converted: converted ?? this.converted,
      canSwapCurrencies: canSwapCurrencies ?? this.canSwapCurrencies,
      convertStateStatus: convertStateStatus ?? this.convertStateStatus,
    );
  }

  @override
  List<Object?> get props => [
        fromCurrencySelected,
        toCurrencySelected,
        fromCurrency,
        toCurrency,
        result,
        exchangeRate,
        amount,
        converted,
        canSwapCurrencies,
        convertStateStatus,
      ];
}
