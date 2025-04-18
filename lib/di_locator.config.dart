// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:infrastructure_base/middleware/di_locator.module.dart' as _i822;
import 'package:injectable/injectable.dart' as _i526;
import 'package:queries/middleware/di_locator.module.dart' as _i276;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    await _i822.InfrastructureBasePackageModule().init(gh);
    await _i276.QueriesPackageModule().init(gh);
    return this;
  }
}
