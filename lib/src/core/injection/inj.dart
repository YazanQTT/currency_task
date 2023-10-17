import 'package:currency_task/src/core/core.export.dart';
import 'package:currency_task/src/core/injection/inj.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies({required Environment env}) => getIt.init(environment: env.name);