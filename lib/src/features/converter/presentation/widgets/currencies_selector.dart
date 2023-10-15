import '../../../../src.export.dart';

class CurrenciesSelector extends StatelessWidget {
  final ConverterBloc converterBloc;

  const CurrenciesSelector({super.key, required this.converterBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConverterBloc, ConverterState>(
      bloc: converterBloc,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  onFromCurrencyTap(context);
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: state.fromCurrencySelected
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CachedImage(
                              imageUrl:
                                  'https://flagcdn.com/w40/${state.fromCurrency?.code.toLowerCase().getISOCode() ?? 'un'}.jpg',
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: Text(state.fromCurrency?.name ?? ''),
                            )
                          ],
                        )
                      : const Text(
                          'From',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: converterBloc.state.canSwapCurrencies
                  ? () {
                      onSwapCurrencies();
                    }
                  : null,
              icon: const Icon(Icons.swap_horiz),
              iconSize: 40,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  onToCurrencyTap(context);
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: state.toCurrencySelected
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CachedImage(
                              imageUrl:
                                  'https://flagcdn.com/w40/${state.toCurrency?.code.toLowerCase().getISOCode() ?? 'un'}.jpg',
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: Text(state.toCurrency?.name ?? ''),
                            )
                          ],
                        )
                      : const Text(
                          'To',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> onFromCurrencyTap(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (_) {
        return ListPicker(
          selectedValue: converterBloc.state.fromCurrency?.code,
        );
      },
    );

    if (result != null) {
      converterBloc.add(FromCurrencyEvent(result));
    }
  }

  Future<void> onToCurrencyTap(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (_) {
        return ListPicker(
          selectedValue: converterBloc.state.toCurrency?.code,
        );
      },
    );

    if (result != null) {
      converterBloc.add(ToCurrencyEvent(result));
    }
  }

  void onSwapCurrencies() {
    if (converterBloc.state.canSwapCurrencies) {
      final fromC = converterBloc.state.fromCurrency;
      final toC = converterBloc.state.toCurrency;
      if (fromC != null && toC != null) {
        converterBloc.add(SwapCurrencyEvent(fromC, toC));
      }
    }
  }
}
