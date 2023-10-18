import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/injection/inj.dart';
import '../../../../src.export.dart';

@LazySingleton(as: ConvertRepository)
class ConvertRepositoryImpl implements ConvertRepository {
  @override
  Future<Either<Failure, ValidResponse>> convertCurrencies(String fCurrencyCode, String tCurrencyCode) async {
    return await getIt.get<ConvertDatasource>().convertCurrencies(fCurrencyCode, tCurrencyCode);
  }
}