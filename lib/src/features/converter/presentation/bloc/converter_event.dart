import 'package:currency_task/src/features/currencies/currencies.export.dart';

abstract class ConverterEvent {}

class FromCurrencyEvent extends ConverterEvent {
  final CurrencyModel currency;

  FromCurrencyEvent(this.currency);
}

class ToCurrencyEvent extends ConverterEvent {
  final CurrencyModel currency;

  ToCurrencyEvent(this.currency);
}

class SwapCurrencyEvent extends ConverterEvent {
  final CurrencyModel fromCurrency;
  final CurrencyModel toCurrency;

  SwapCurrencyEvent(this.fromCurrency, this.toCurrency);
}

class ConvertCurrenciesEvent extends ConverterEvent {
  final CurrencyModel fromCurrency;
  final CurrencyModel toCurrency;
  final String amount;

  ConvertCurrenciesEvent(
      {required this.fromCurrency,
      required this.toCurrency,
      required this.amount});
}

class AmountChangeEvent extends ConverterEvent {
  final String amount;

  AmountChangeEvent(this.amount);
}
