import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/injection/inj.dart';
import '../../../../src.export.dart';

@LazySingleton(as: CurrencyLocalDatasource)
class CurrencyLocalDatasourceImpl implements CurrencyLocalDatasource {

  @override
  Future<Either<Failure, ValidResponse>> fetchData() async {
    final data = await getIt.get<SqfliteService>().getData();
    if (data.isNotEmpty) {
      final responseData = data.map((map) => CurrencyModel.fromJson(map)).toList();
      return Right(ValidResponse(statusCode: 200, data: responseData));
    } else {
      return Left(Failure(statusCode: 500, message: 'Failed to retrieve data'));
    }
  }

  @override
  Future<bool> insertData(List<CurrencyModel> currencies) async {
    return await getIt.get<SqfliteService>().insertData(currencies);
  }
}
