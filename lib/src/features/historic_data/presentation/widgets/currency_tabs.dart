import '../../../../src.export.dart';

class CurrencyTabs extends StatelessWidget {
  const CurrencyTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
    tabs: [
      Tab(child: CachedImage(imageUrl: 'https://flagcdn.com/w40/gb.jpg'),),
      Tab(child: CachedImage(imageUrl: 'https://flagcdn.com/w40/eu.jpg'),),
    ],
    );
  }
}
