import 'src/src.export.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppWidget extends StatelessWidget {
  final ThemeData themeData;
  const AppWidget({super.key, required this.themeData});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return listOfBloc(
      child: MaterialApp(
        title: 'Currency Task',
        debugShowCheckedModeBanner: false,
        theme: this.themeData,
        navigatorKey: navigatorKey,
        home: const NavBar(),
      ),
    );
  }
}

MultiBlocProvider listOfBloc({required Widget child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<NavBarBloc>(
        create: (_) => NavBarBloc(),
      ),
      BlocProvider<CurrencyBloc>(
        create: (_) => CurrencyBloc(),
      ),
      BlocProvider<ConverterBloc>(
        create: (_) => ConverterBloc(),
      ),
      BlocProvider<HistoricBloc>(
        create: (_) => HistoricBloc(),
      ),
    ],
    child: child,
  );
}
