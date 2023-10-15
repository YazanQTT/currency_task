import '../../../../src.export.dart';

class InfoList extends StatelessWidget {
  final List<ExchangeRatesEntity> rates;
  final String code;
  const InfoList({required this.rates, required this.code});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoricBloc, HistoricState>(
      bloc: context.read<HistoricBloc>(),
      builder: (context, state) {
        if (state.historicStateStatus == HistoricStateStatus.SUCCESS)
          return _buildHistory();

        return const SizedBox();
      },
    );
  }

  Widget _buildHistory() {
    rates.sort((a, b) => (b.date ?? '').compareTo(a.date ?? ''));
    return ListView.builder(
      itemCount: rates.length,
      itemBuilder: (_, index) => buildDataRow(index),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  Widget buildDataRow(int index) {
    return InfoCard(
      date: rates[index].date,
      flag: 'https://flagcdn.com/w20/$code.jpg',
      rate: rates[index].rate,
    );
  }
}
