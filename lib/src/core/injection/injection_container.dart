import 'package:currency_task/src/src.export.dart';

final locator = GetIt.instance;

void initLocator() {
  //Services
  locator.registerLazySingleton<NetworkService>(() => NetworkServiceImpl());
  locator.registerLazySingleton<SqfliteService>(() => SqfliteServiceImpl());
  locator.registerLazySingleton<ConnectivityServiceImpl>(() => ConnectivityServiceImpl());

  //Datasources
  locator.registerLazySingleton<CurrencyRemoteDatasource>(() => RemoteDataSourceImpl());
  locator.registerLazySingleton<CurrencyLocalDatasource>(() => CurrencyLocalDatasourceImpl());
  locator.registerLazySingleton<HistoricDatasource>(() => RemoteHistoricDatasourceImpl());
  locator.registerLazySingleton<ConvertDatasource>(() => RemoteConvertDatasource());

  //Repositories
  locator.registerLazySingleton<CurrencyRepository>(() => CurrencyRepositoryImpl());
  locator.registerLazySingleton<HistoricRepository>(() => HistoricRepositoryImpl());
  locator.registerLazySingleton<ConvertRepository>(() => ConvertRepositoryImpl());

  //Use cases
  locator.registerLazySingleton<CurrencyUseCases>(() => CurrencyUseCases());
  locator.registerLazySingleton<HistoricUseCases>(() => HistoricUseCases());
  locator.registerLazySingleton<ConvertUseCases>(() => ConvertUseCases());
}
