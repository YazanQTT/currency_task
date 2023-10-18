import 'dart:async';

import 'package:currency_task/src/core/injection/inj.dart';

import '../../../../src.export.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(const CurrencyState()) {
    on<GetCurrenciesEvent>(_handleEvent);
  }

  Future<FutureOr<void>> _handleEvent(
      GetCurrenciesEvent event, Emitter<CurrencyState> emit) async {
    emit(state.copyWith(status: CurrencyStateStatus.LOADING));

    final result = await getIt.get<CurrencyUseCases>().execute();

    result.fold((l) {
      emit(state.copyWith(status: CurrencyStateStatus.ERROR));
    }, (r) {
      emit(state.copyWith(
        status: CurrencyStateStatus.SUCCESS,
        currencyList: r.data,
      ));
    });
  }
}
