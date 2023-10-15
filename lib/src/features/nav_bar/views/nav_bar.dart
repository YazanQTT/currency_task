import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../src.export.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navBloc = NavBarBloc();

    return BlocBuilder<NavBarBloc, NavBarState>(
      bloc: navBloc,
      builder: (context, state) {
        return Scaffold(
          body: WillPopScope(
            onWillPop: () async {
              navBloc.add(NavBarScreenChanged(index: 0));
              return false;
            },
            child: IndexedStack(
              index: state.selectedScreen,
              children: [
                const ConverterPage(),
                const CurrenciesPage(),
                const HistoricPage(),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: GNav(
                tabBackgroundColor: Colors.blueAccent.shade100,
                gap: 8,
                padding: const EdgeInsets.all(16),
                onTabChange: (index) {
                  navBloc.add(NavBarScreenChanged(index: index));
                },
                selectedIndex: state.selectedScreen,
                tabs: [
                  const GButton(
                    icon: Icons.currency_exchange,
                    text: 'Converter',
                  ),
                  const GButton(
                    icon: Icons.list_alt,
                    text: 'Currencies',
                  ),
                  const GButton(
                    icon: Icons.area_chart,
                    text: 'Chart',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
