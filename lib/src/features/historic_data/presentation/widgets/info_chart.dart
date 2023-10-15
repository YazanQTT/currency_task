import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../../../../src.export.dart';


class InfoChart extends StatelessWidget {
  final List<ExchangeRatesEntity> rates;
  final Color chartColor;
  const InfoChart({required this.rates, required this.chartColor});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoricBloc, HistoricState>(
      bloc: context.read<HistoricBloc>(),
      builder: (context, state) {
        if (state.historicStateStatus == HistoricStateStatus.SUCCESS)
          return _buildChart();

        if (state.historicStateStatus == HistoricStateStatus.LOADING)
          return const CenterProgressIndicator();

        return const Center(child: Text('No data to show'));
      },
    );
  }

  Widget _buildChart() {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(
            show: true,
            topTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1.0,
                getTitlesWidget: (value, _) {
                  return Text(getFirstLetterOfDay(value));
                },
              ),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
                interval: 1.0,
              ),
            ),
          ),
          lineBarsData: [
            getChartData(),
          ],
          borderData: FlBorderData(
            show: false,
          ),
          gridData: const FlGridData(
            show: true,
            drawVerticalLine: false,
            drawHorizontalLine: true,
          ),
        ),
      ),
    );
  }

  LineChartBarData getChartData() {
    return LineChartBarData(
      spots: getSpots(),
      isCurved: false,
      color: chartColor,
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            easyTheme().primaryColor,
            chartColor,
          ],
        ),
      ),
    );
  }

  List<FlSpot> getSpots() {
    return rates.map((e) {
      return FlSpot(getDateValue(e.date), getExchangeRateValue(e.rate));
    }).toList();
  }

  String getFirstLetterOfDay(double value) {
    final day = DateTime.now().subtract(Duration(days: value.toInt()));
    return DateFormat('E').format(day).substring(0, 2);
  }

  double getDateValue(String value) {
    final date = DateTime.parse(value);
    final referenceDate = DateTime.now();
    return referenceDate.difference(date).inDays.toDouble().abs();
  }

  double getExchangeRateValue(double value) {
    final exchangeRate = (value).toStringAsFixed(4);
    return double.tryParse(exchangeRate) ?? 0;
  }
}
