import 'package:currency_task/src/src.export.dart';

class CurrencyModel extends CurrencyEntity {
  const CurrencyModel({
    required String code,
    required String name,
    required String symbol,
    required String id,
  }) : super(id: id, code: code, name: name, symbol: symbol);

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      code: json['id'] ?? '-',
      name: json['currencyName'] ?? '-',
      symbol: json['currencySymbol'] ?? '-',
      id: json['id'] ?? '-',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['currencyName'] = this.name;
    data['currencySymbol'] = this.symbol;
    data['code'] = this.code;
    return data;
  }
}
