// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:currency_task/src/features/converter/data/datasource/remote_convert_datasource.dart'
    as _i5;
import 'package:currency_task/src/features/converter/data/repositories/convert_repository_impl.dart'
    as _i6;
import 'package:currency_task/src/features/converter/domain/use_cases/convert_use_cases.dart'
    as _i7;
import 'package:currency_task/src/features/currencies/data/datasource/currency_local_datasource_impl.dart'
    as _i8;
import 'package:currency_task/src/features/currencies/data/datasource/currency_remote_datasource_impl.dart'
    as _i9;
import 'package:currency_task/src/features/currencies/data/repositories/currency_repository_impl.dart'
    as _i10;
import 'package:currency_task/src/features/currencies/domain/use_cases/currency_use_cases.dart'
    as _i11;
import 'package:currency_task/src/features/historic_data/data/datasource/historic_remote_datasource_impl.dart'
    as _i12;
import 'package:currency_task/src/features/historic_data/data/repositories/historic_repository_impl.dart'
    as _i13;
import 'package:currency_task/src/features/historic_data/domain/use_cases/historic_use_cases.dart'
    as _i14;
import 'package:currency_task/src/services/connectivity/connectivity_service.dart'
    as _i3;
import 'package:currency_task/src/services/network/network_service.dart'
    as _i15;
import 'package:currency_task/src/services/sqflite/sqflite_service.dart'
    as _i16;
import 'package:currency_task/src/src.export.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _dev = 'dev';
const String _test = 'test';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ConnectivityService>(_i3.ConnectivityServiceImpl());
    gh.lazySingleton<_i4.ConvertDatasource>(
        () => _i5.RemoteConvertDatasource());
    gh.lazySingleton<_i4.ConvertRepository>(() => _i6.ConvertRepositoryImpl());
    gh.lazySingleton<_i7.ConvertUseCases>(
      () => _i7.ConvertUseCasesImpl(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i7.ConvertUseCases>(
      () => _i7.MockConvertUseCasesImpl(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i4.CurrencyLocalDatasource>(
        () => _i8.CurrencyLocalDatasourceImpl());
    gh.lazySingleton<_i4.CurrencyRemoteDatasource>(
        () => _i9.CurrencyRemoteDatasourceImpl());
    gh.lazySingleton<_i4.CurrencyRepository>(
        () => _i10.CurrencyRepositoryImpl());
    gh.lazySingleton<_i11.CurrencyUseCases>(
      () => _i11.CurrencyUseCasesImpl(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i11.CurrencyUseCases>(
      () => _i11.MockCurrencyUseCasesImpl(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i4.HistoricDatasource>(
        () => _i12.RemoteHistoricDatasourceImpl());
    gh.lazySingleton<_i4.HistoricRepository>(
        () => _i13.HistoricRepositoryImpl());
    gh.lazySingleton<_i14.HistoricUseCases>(
      () => _i14.HistoricUseCasesImpl(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i14.HistoricUseCases>(
      () => _i14.MockHistoricUseCasesImpl(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i15.NetworkService>(() => _i15.NetworkServiceImpl());
    gh.lazySingleton<_i16.SqfliteService>(() => _i16.SqfliteServiceImpl());
    return this;
  }
}
