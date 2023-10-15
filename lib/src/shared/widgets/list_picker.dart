import '../../src.export.dart';

class ListPicker extends StatelessWidget {
  final String? selectedValue;

  const ListPicker({super.key, this.selectedValue});

  @override
  Widget build(BuildContext context) {
    final currencyBloc = CurrencyBloc(currencyUseCases: locator.get<CurrencyUseCases>());

    currencyBloc.add(GetCurrenciesEvent());

    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      content: _buildList(currencyBloc),
    );
  }

  Widget _buildList(CurrencyBloc currencyBloc) {
    return Container(
      width: 400,
      height: 400,
      child: BlocConsumer<CurrencyBloc, CurrencyState>(
        bloc: currencyBloc,
        builder: _buildUI,
        listener: _onListen,
      ),
    );
  }

  Widget _buildUI(BuildContext context, CurrencyState state) {
    if (state.status == CurrencyStateStatus.LOADING) {
      return const CenterProgressIndicator();
    }

    if (state.status == CurrencyStateStatus.SUCCESS &&
        state.currencyList.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (_, index) =>
              itemBuilder(context, index, state.currencyList[index]),
          itemCount: state.currencyList.length,
        ),
      );
    }

    return const Center(
      child: Text('No data to show.'),
    );
  }

  Widget itemBuilder(BuildContext context, int index, CurrencyModel currency) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, currency);
      },
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          child: CachedImage(
            imageUrl: 'https://flagcdn.com/w40/${currency.code.toLowerCase().getISOCode()}.jpg',
          ),
        ),
        title: Text(
          currency.name,
          style: const TextStyle(color: Colors.white),
        ),
        trailing: selectedValue == currency.code ? const Icon(Icons.check) : const SizedBox(),
      ),
    );
  }

  void _onListen(BuildContext context, CurrencyState state) {
    if (state.status == CurrencyStateStatus.ERROR) {
      showErrorSnackBar('Failed to load currencies.');
    }
  }
}
