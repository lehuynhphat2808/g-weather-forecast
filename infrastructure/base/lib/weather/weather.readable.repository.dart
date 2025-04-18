import 'package:domain/weather/abstract.weather.readable.repository.dart';
import 'package:http/http.dart' as http;
import 'package:infrastructure_base/readable.repository.dart';
import 'package:infrastructure_base/x_helper/endpoint.constant.dart';
import 'package:injectable/injectable.dart';
import 'package:messages/weather/get_weather.request.dart';

@Injectable(as: AbstractWeatherReadableRepository)
class WeatherReadableRepository extends ReadableRepository implements AbstractWeatherReadableRepository {
  WeatherReadableRepository({required super.context});

  /// This method is used to get weather.
  ///
  /// It takes a `GetWeatherRequest` object as input and returns an `Either` object.
  /// The `Either` object will either contain a `GetWeatherResponse` object if the request was successful, or a
  /// `GetWeatherErrorResponse` object if the request failed.
  @override
  Future<http.Response> getForecast(GetWeatherRequest request) async {
    return findAll('${EndpointConstant.getForecast}?q=${request.locationName}&days=${request.days ?? 5}');
  }
}
