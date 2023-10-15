import 'package:currency_task/src/core/core.export.dart';

class HistoricDataEntity extends Equatable {
  final String fCode;
  final String tCode;
  final List<ExchangeRatesEntity> fRates;
  final List<ExchangeRatesEntity> tRates;

  const HistoricDataEntity({required this.fCode, required this.tCode, required this.fRates, required this.tRates});

  @override
  List<Object> get props => [fCode, tCode, fRates, tRates];
}

class ExchangeRatesEntity extends Equatable {
  final String date;
  final double rate;
  const ExchangeRatesEntity({required this.date, required this.rate});

  @override
  List<Object?> get props => [date, rate];
}
