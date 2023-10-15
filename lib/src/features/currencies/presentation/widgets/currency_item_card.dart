import '../../../../src.export.dart';

class CurrencyItemCard extends StatelessWidget {
  final CurrencyModel currency;

  const CurrencyItemCard({super.key, required this.currency});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.black,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: InkWell(
          onTap: () {
            //
          },
          child: ListTile(
            leading: Container(
              height: 50,
              width: 50,
              child: CachedImage(
                imageUrl:
                    'https://flagcdn.com/w40/${currency.code.getISOCode()}.jpg',
              ),
            ),
            title: Text(
              currency.name ?? '',
              style: const TextStyle(color: Colors.white),
            ),
            trailing: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.shade800,
              ),
              alignment: Alignment.center,
              child: Text(
                currency.symbol ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
