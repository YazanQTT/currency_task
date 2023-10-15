import '../../../../src.export.dart';

class CurrenciesPage extends StatelessWidget {
  const CurrenciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyBloc = CurrencyBloc(currencyUseCases: locator.get<CurrencyUseCases>());
    currencyBloc.add(GetCurrenciesEvent());

    return Scaffold(
      body: SafeArea(
        child: _body(currencyBloc),
      ),
    );
  }

  Widget _body(CurrencyBloc currencyBloc) {
    return BlocConsumer<CurrencyBloc, CurrencyState>(
      bloc: currencyBloc,
      builder: _buildUI,
      listener: _onListen,
    );
  }

  Widget _buildUI(BuildContext context, CurrencyState state) {
    if (state.status == CurrencyStateStatus.LOADING) {
      return const CenterProgressIndicator();
    }

    if (state.status == CurrencyStateStatus.SUCCESS && state.currencyList.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (_, index) => itemBuilder(index, state.currencyList[index]),
          itemCount: state.currencyList.length,
        ),
      );
    }

    return const Center(
      child: Text('No data to show.'),
    );
  }

  Widget itemBuilder(int index, CurrencyModel currency) {
    return CurrencyItemCard(currency: currency);
  }

  void _onListen(BuildContext context, CurrencyState state) {
    if (state.status == CurrencyStateStatus.ERROR) {
      showErrorSnackBar('Failed to load currencies.');
    }
  }
}
