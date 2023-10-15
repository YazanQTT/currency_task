import 'package:currency_task/src/core/core.export.dart';

class CurrencyEntity extends Equatable {
  final String code;
  final String name;
  final String symbol;
  final String id;

  const CurrencyEntity({required this.id, required this.code, required this.name, required this.symbol});

  @override
  List<Object?> get props => [id, code, name, symbol];
}