import 'package:currency_task/src/core/injection/inj.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../src.export.dart';

@LazySingleton(as: CurrencyRepository)
class CurrencyRepositoryImpl implements CurrencyRepository {
  @override
  Future<Either<Failure, ValidResponse>> getCurrencies() async {
    final data = await getIt.get<CurrencyLocalDatasource>().fetchData();
    if (data.isLeft()) {
      return await getIt.get<CurrencyRemoteDatasource>().fetchData();
    } else {
      return data;
    }
  }
}
