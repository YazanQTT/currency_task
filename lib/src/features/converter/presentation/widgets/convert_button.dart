import '../../../../src.export.dart';

class ConvertButton extends StatelessWidget {
  final ConverterBloc converterBloc;

  const ConvertButton({super.key, required this.converterBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ElevatedButton(
        onPressed:()=> onConvertTap(context),
        child: const Text('Convert'),
      ),
    );
  }

  void onConvertTap(BuildContext context) {

    final fromC = converterBloc.state.fromCurrency;
    final toC = converterBloc.state.toCurrency;
    final amount = converterBloc.state.amount;

    if (fromC == null || toC == null || amount.isEmpty) return;

    FocusScope.of(context).requestFocus(FocusNode());
    converterBloc.add(
      ConvertCurrenciesEvent(
        fromCurrency: fromC,
        toCurrency: toC,
        amount: amount,
      ),
    );
  }
}
