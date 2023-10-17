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
