import 'package:currency_task/src/src.export.dart';

enum HistoricStateStatus { INITIAL, LOADING, SUCCESS, ERROR }

class HistoricState extends Equatable {
  final HistoricDataModel? historicData;
  final HistoricStateStatus historicStateStatus;

  const HistoricState({
    this.historicData,
    this.historicStateStatus = HistoricStateStatus.INITIAL,
  });

  HistoricState copyWith({
    HistoricDataModel? historicData,
    HistoricStateStatus? historicStateStatus,
  }) {
    return HistoricState(
      historicData: historicData ?? this.historicData,
      historicStateStatus: historicStateStatus ?? this.historicStateStatus,
    );
  }

  @override
  List<Object?> get props => [historicData, historicStateStatus];
}
