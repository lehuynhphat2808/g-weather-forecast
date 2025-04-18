//@GeneratedMicroModule;QueriesPackageModule;package:queries/middleware/di_locator.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:domain/email/abstract.email.readable.repository.dart' as _i430;
import 'package:domain/weather/abstract.weather.readable.repository.dart'
    as _i664;
import 'package:injectable/injectable.dart' as _i526;
import 'package:queries/email/send_otp.handler.dart' as _i154;
import 'package:queries/weather/get_weather_query.handler.dart' as _i850;

class QueriesPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i154.SendOTPQueryHandler>(() =>
        _i154.SendOTPQueryHandler(gh<_i430.AbstractEmailReadableRepository>()));
    gh.factory<_i850.GetWeatherQueryHandler>(() => _i850.GetWeatherQueryHandler(
        gh<_i664.AbstractWeatherReadableRepository>()));
  }
}
