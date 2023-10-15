import 'dart:async';

import '../../../../src.export.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyUseCases currencyUseCases;

  CurrencyBloc({required this.currencyUseCases})
      : super(const CurrencyState()) {
    on<GetCurrenciesEvent>(_handleEvent);
  }

  Future<FutureOr<void>> _handleEvent(
      GetCurrenciesEvent event, Emitter<CurrencyState> emit) async {
    emit(state.copyWith(status: CurrencyStateStatus.LOADING));
    final result = await currencyUseCases.execute();

    if (result.statusCode?.successResponse() ?? false) {
      emit(state.copyWith(
        status: CurrencyStateStatus.SUCCESS,
        currencyList: result.data,
      ));
    } else {
      emit(state.copyWith(status: CurrencyStateStatus.ERROR));
    }
  }
}
