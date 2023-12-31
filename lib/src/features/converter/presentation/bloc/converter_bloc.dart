import 'dart:async';

import 'package:currency_task/src/core/injection/inj.dart';

import '../../../../src.export.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  ConverterBloc() : super(const ConverterState()) {
    on<ConverterEvent>(_handleEvent);
  }

  Future<FutureOr<void>> _handleEvent(
      ConverterEvent event, Emitter<ConverterState> emit) async {
    if (event is AmountChangeEvent) {
      emit(state.copyWith(amount: event.amount, converted: false));
    }

    if (event is FromCurrencyEvent) {
      emit(state.copyWith(
        fromCurrencySelected: true,
        fromCurrency: event.currency,
        converted: false,
        canSwapCurrencies: state.toCurrency != null,
      ));
    }

    if (event is ToCurrencyEvent) {
      emit(state.copyWith(
        toCurrencySelected: true,
        toCurrency: event.currency,
        converted: false,
        canSwapCurrencies: state.fromCurrency != null,
      ));
    }

    if (event is SwapCurrencyEvent && state.canSwapCurrencies) {
      emit(state.copyWith(
        fromCurrencySelected: true,
        fromCurrency: event.toCurrency,
        toCurrencySelected: true,
        toCurrency: event.fromCurrency,
        converted: false,
      ));
    }

    if (event is ConvertCurrenciesEvent) {
      emit(state.copyWith(convertStateStatus: ConvertStateStatus.LOADING));

      if (state.fromCurrency?.code == state.toCurrency?.code) {
        emit(
          state.copyWith(
            result: state.amount,
            exchangeRate: '1',
            converted: true,
            convertStateStatus: ConvertStateStatus.SUCCESS,
          ),
        );
      } else {
        final result = await getIt.get<ConvertUseCases>().execute(
              state.fromCurrency?.code ?? '',
              state.toCurrency?.code ?? '',
            );

        result.fold(
            (l) => emit(
                state.copyWith(convertStateStatus: ConvertStateStatus.ERROR)),
            (r) {
          final convert = ConvertModel.fromJson(r.data);
          emit(
            state.copyWith(
              result: getResult(convert.exchangeRate, state.amount),
              exchangeRate: convert.exchangeRate.toStringAsFixed(4),
              converted: true,
              convertStateStatus: ConvertStateStatus.SUCCESS,
            ),
          );
        });
      }
    }
  }

  String getResult(double exchangeRate, String amount) {
    if (amount.isEmpty) return '';
    final amountValue = double.tryParse(amount) ?? 1;
    return (exchangeRate * amountValue).toStringAsFixed(4);
  }
}
