import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:g_weather_forecast/di_locator.dart';
import 'package:infrastructure_base/secure_storage/secure_storage.dart';
import 'package:infrastructure_base/x_helper/x.constant.dart';
import 'package:messages/weather/get_weather.request.dart';
import 'package:messages/weather/get_weather.response.dart';
import 'package:messages/weather/get_weather_error.response.dart';
import 'package:queries/weather/get_weather_query.handler.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState()) {
    on<OnGettingWeatherEvent>(_onGettingWeatherEvent);
    on<OnGettingSavedWeatherEvent>(_onGettingSavedWeatherEvent);
  }

  /// [_onGettingWeatherEvent] is called when the [OnGettingWeatherEvent] is added.
  /// It will emit [LoadingGetWeatherState] if isLoading is true.
  /// It will then call the [GetWeatherQueryHandler] to get the weather.
  /// If the result is successful, it will emit [SuccessGetWeatherState].
  /// If the result is an error, it will emit [ErrorGetWeatherState].
  ///
  /// Args:
  ///   event (OnGettingWeatherEvent): The event that was added.
  ///   emitter (Emitter<WeatherState>): The emitter that will be used to emit new states.
  _onGettingWeatherEvent(OnGettingWeatherEvent event, Emitter<WeatherState> emitter) async {
    if (event.isLoading) {
      emitter(LoadingGetWeatherState());
    }
    final result = await getIt<GetWeatherQueryHandler>().handle(event.getWeatherRequest);
    await result.fold(
      (l) {
        emitter(ErrorGetWeatherState(GetWeatherErrorResponse(title: l.title, detail: l.detail, status: l.status)));
      },
      (r) async {
        await getIt<SecureStorage>().setItem(XConstant.WEATHER_KEY, jsonEncode(r.toJson()));
        emitter(SuccessGetWeatherState(getWeatherResponse: r));
      },
    );
  }

  _onGettingSavedWeatherEvent(OnGettingSavedWeatherEvent event, Emitter<WeatherState> emitter) async {
    if (event.isLoading) {
      emitter(LoadingGetWeatherState());
    }
    final result = await getIt<SecureStorage>().getItem(XConstant.WEATHER_KEY);
    if (result != null) {
      emitter(SuccessGetWeatherState(getWeatherResponse: GetWeatherResponse.fromJson(jsonDecode(result))));
    } else {
      add(OnGettingWeatherEvent(GetWeatherRequest(locationName: dotenv.get('DEFAULT_LOCATION'))));
    }
  }
}
