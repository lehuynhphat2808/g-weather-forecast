//@GeneratedMicroModule;InfrastructureBasePackageModule;package:infrastructure_base/middleware/di_locator.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:domain/email/abstract.email.readable.repository.dart' as _i430;
import 'package:domain/weather/abstract.weather.readable.repository.dart'
    as _i664;
import 'package:infrastructure_base/base.context.dart' as _i1065;
import 'package:infrastructure_base/email/email.readable.repository.dart'
    as _i682;
import 'package:infrastructure_base/email_context.dart' as _i687;
import 'package:infrastructure_base/secure_storage/secure_storage.dart'
    as _i742;
import 'package:infrastructure_base/weather/weather.readable.repository.dart'
    as _i597;
import 'package:injectable/injectable.dart' as _i526;

class InfrastructureBasePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i1065.BaseContext>(() => _i1065.BaseContext());
    gh.factory<_i687.EmailContext>(() => _i687.EmailContext());
    gh.singleton<_i742.SecureStorage>(() => _i742.SecureStorage()..init());
    gh.factory<_i664.AbstractWeatherReadableRepository>(() =>
        _i597.WeatherReadableRepository(context: gh<_i1065.BaseContext>()));
    gh.factory<_i430.AbstractEmailReadableRepository>(
        () => _i682.EmailReadableRepository());
  }
}
