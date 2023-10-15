import 'dart:async';

import '../../../../src.export.dart';

class HistoricBloc extends Bloc<HistoricEvent, HistoricState> {
  final HistoricUseCases historicUseCases;

  HistoricBloc({required this.historicUseCases})
      : super(const HistoricState()) {
    on<HistoricEvent>(_handleEvent);
  }

  Future<FutureOr<void>> _handleEvent(HistoricEvent event, Emitter<HistoricState> emit) async {

    emit(state.copyWith(historicStateStatus: HistoricStateStatus.LOADING));

    final result = await historicUseCases.execute();

    if (result.statusCode?.successResponse() ?? false) {
      final responseData = result.data as Map<String, dynamic>;
      emit(
        state.copyWith(
          historicData: HistoricDataModel.fromJson(responseData),
          historicStateStatus: HistoricStateStatus.SUCCESS,
        ),
      );
    } else {
      emit(state.copyWith(historicStateStatus: HistoricStateStatus.ERROR));
    }
  }
}
