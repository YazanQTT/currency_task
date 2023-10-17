import '../../../../src.export.dart';

class HistoricPage extends StatelessWidget {
  const HistoricPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const CurrencyTabs(),
        ),
        body: SafeArea(child: _body(context)),
      ),
    );
  }

  Widget _body(BuildContext context) {
    final historicBloc = context.read<HistoricBloc>();
    historicBloc.add(GetHistoricDataEvent());
    return BlocBuilder<HistoricBloc, HistoricState>(
      bloc: historicBloc,
      builder: (context, state) {
        return TabBarView(
          children: [
            _widgets('gb', historicBloc.state.historicData?.fRates ?? [], Colors.blueAccent.shade100),
            _widgets('eu', historicBloc.state.historicData?.tRates ?? [], Colors.red.shade700),
          ],
        );
      },
    );
  }

  Widget _widgets(String code, List<ExchangeRatesEntity> rates,
      Color chartColor) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(ValueConstants.formSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            InfoChart(
              rates: rates,
              chartColor: chartColor,
            ),
            const SizedBox(
              height: ValueConstants.itemsVerticalSpace,
            ),
            InfoList(
              rates: rates,
              code: code,
            ),
          ],
        ),
      ),
    );
  }
}
