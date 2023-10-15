import '../../../../src.export.dart';

enum CurrencyStateStatus { INITIAL, SUCCESS, ERROR, LOADING }

class CurrencyState extends Equatable {
  final CurrencyStateStatus status;
  final List<CurrencyModel> currencyList;

  const CurrencyState({
    this.status = CurrencyStateStatus.INITIAL,
    this.currencyList = const [],
  });

  CurrencyState copyWith({
    CurrencyStateStatus? status,
    List<CurrencyModel>? currencyList,
  }) {
    return CurrencyState(
      status: status ?? this.status,
      currencyList: currencyList ?? this.currencyList,
    );
  }

  @override
  List<Object?> get props => [
        status,
        currencyList,
      ];
}
