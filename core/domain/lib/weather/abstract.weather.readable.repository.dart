import 'package:core_base/abstract.readable.repository.dart';
import 'package:http/http.dart' as http;
import 'package:messages/weather/get_weather.request.dart';

abstract class AbstractWeatherReadableRepository extends AbstractReadableRepository {
  /// get weather by location name
  Future<http.Response> getForecast(GetWeatherRequest request);
}
