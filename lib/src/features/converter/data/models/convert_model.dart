class ConvertModel {
  double exchangeRate;

  ConvertModel({this.exchangeRate = 1});

  factory ConvertModel.fromJson(Map<String, dynamic> json) {
    final data = json.keys.first;
    return ConvertModel(exchangeRate: json[data]);
  }
}