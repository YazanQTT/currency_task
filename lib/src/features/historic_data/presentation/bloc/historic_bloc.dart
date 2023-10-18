import 'dart:async';

import 'package:currency_task/src/core/injection/inj.dart';

import '../../../../src.export.dart';

class HistoricBloc extends Bloc<HistoricEvent, HistoricState> {
  HistoricBloc() : super(const HistoricState()) {
    on<HistoricEvent>(_handleEvent);
  }

  Future<FutureOr<void>> _handleEvent(
      HistoricEvent event, Emitter<HistoricState> emit) async {
    emit(state.copyWith(historicStateStatus: HistoricStateStatus.LOADING));
    final result = await getIt.get<HistoricUseCases>().execute();

    result.fold((l) {
      emit(state.copyWith(historicStateStatus: HistoricStateStatus.ERROR));
    }, (r) {
      final responseData = r.data as Map<String, dynamic>;
      emit(
        state.copyWith(
          historicData: HistoricDataModel.fromJson(responseData),
          historicStateStatus: HistoricStateStatus.SUCCESS,
        ),
      );
    });
  }
}
