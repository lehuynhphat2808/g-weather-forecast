import 'package:g_weather_forecast/di_locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:infrastructure_base/middleware/di_locator.module.dart';
import 'package:injectable/injectable.dart';
import 'package:queries/middleware/di_locator.module.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
  externalPackageModulesBefore: [ExternalModule(InfrastructureBasePackageModule), ExternalModule(QueriesPackageModule)],
)
void configureDependencies() => getIt.init();
