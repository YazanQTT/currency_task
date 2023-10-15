import '../../../../src.export.dart';

class HistoricDataModel extends HistoricDataEntity {
  const HistoricDataModel({
    required String fCode,
    required String tCode,
    required List<ExchangeRatesModel> fRates,
    required List<ExchangeRatesModel> tRates,
  }) : super(fCode: fCode, tCode: tCode, fRates: fRates, tRates: tRates);

  factory HistoricDataModel.fromJson(Map<String, dynamic> json) {
    final result = <String, List<Map<String, dynamic>>>{};

    json.forEach((key, value) {
      final rateList = <Map<String, dynamic>>[];
      value.forEach((date, rate) {
        rateList.add({
          "date": date,
          "rate": rate,
        });
      });
      result[key] = rateList;
    });

    const fCode = 'GBP_USD';
    const tCode = 'EUR_USD';

    final fRates = (result['GBP_USD'] as List)
        .map((rate) => ExchangeRatesModel.fromJson(rate))
        .toList();

    final tRates = (result['EUR_USD']  as List)
        .map((rate) => ExchangeRatesModel.fromJson(rate))
        .toList();

    return HistoricDataModel(
      fCode: fCode,
      tCode: tCode,
      fRates: fRates,
      tRates: tRates,
    );
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'fCode': this.fCode,
      'tCode': this.tCode,
      // 'fRates': this.fRates.map((rate) => rate.toJson()).toList(),
      // 'tRates': this.tRates.map((rate) => rate.toJson()).toList(),
    };

    return data;
  }
}

class ExchangeRatesModel extends ExchangeRatesEntity {
  const ExchangeRatesModel({required super.date, required super.rate});

  factory ExchangeRatesModel.fromJson(Map<String, dynamic> json) {
    return ExchangeRatesModel(
      date: json['date'] as String,
      rate: (json['rate'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'rate': rate,
    };
  }
}
