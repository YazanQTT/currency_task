import '../../../../src.export.dart';

class ConvertResult extends StatelessWidget {
  final ConverterBloc converterBloc;

  const ConvertResult({super.key, required this.converterBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConverterBloc, ConverterState>(
      bloc: converterBloc,
      builder: (context, state) {
        if (state.converted) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${state.amount} ${state.fromCurrency?.name ?? ''} equals',
                style: easyTheme()
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: easyTheme().secondaryHeaderColor),
              ),
              const SizedBox(
                height: ValueConstants.itemsVerticalSpace,
              ),
              Text(
                '${state.result} ${state.toCurrency?.name ?? ''}',
                style: easyTheme()
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: easyTheme().colorScheme.secondary),
              ),
              const SizedBox(
                height: ValueConstants.itemsVerticalSpace,
              ),
              Text(
                'Exchange rate: ${state.exchangeRate}',
                style: easyTheme()
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: easyTheme().secondaryHeaderColor),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
