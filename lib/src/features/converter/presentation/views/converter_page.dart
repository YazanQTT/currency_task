import '../../../../src.export.dart';

class ConverterPage extends StatelessWidget {
  const ConverterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final converterBloc =
        ConverterBloc(convertUseCases: locator.get<ConvertUseCases>());
    final amountController = TextEditingController();

    return Scaffold(
      body: SafeArea(child: _body(context, converterBloc, amountController)),
    );
  }

  Widget _body(BuildContext context, ConverterBloc converterBloc,
      TextEditingController amountController) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(ValueConstants.formSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _title(),
            const SizedBox(
              height: ValueConstants.itemsVerticalSpace,
            ),
            CurrenciesSelector(converterBloc: converterBloc),
            const SizedBox(
              height: ValueConstants.itemsVerticalSpace,
            ),
            AmountField(
              converterBloc: converterBloc,
              amountController: amountController,
            ),
            const SizedBox(
              height: ValueConstants.itemsVerticalSpace,
            ),
            ConvertButton(converterBloc: converterBloc),
            const SizedBox(
              height: ValueConstants.itemsVerticalSpace,
            ),
            ConvertResult(converterBloc: converterBloc),
            const SizedBox(
              height: ValueConstants.itemsVerticalSpace,
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Text(
      'Currency Converter',
      style: easyTheme().textTheme.headlineSmall,
    );
  }
}
