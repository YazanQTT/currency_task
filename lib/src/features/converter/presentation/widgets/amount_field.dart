import '../../../../src.export.dart';

class AmountField extends StatelessWidget {
  final ConverterBloc converterBloc;
  final TextEditingController amountController;

  const AmountField(
      {super.key, required this.converterBloc, required this.amountController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: amountController,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,5}')),
      ],
      decoration: InputDecoration(
        labelText: 'Enter amount',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onChanged: onTextChange,
    );
  }

  void onTextChange(String val) {
    converterBloc.add(AmountChangeEvent(amountController.text));
  }
}
