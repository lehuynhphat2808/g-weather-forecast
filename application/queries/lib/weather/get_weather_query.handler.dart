import 'dart:convert';

import 'package:application_base/request.handler.dart';
import 'package:domain/weather/abstract.weather.readable.repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:messages/abstract.error.response.dart';
import 'package:messages/weather/get_weather.response.dart';
import 'package:messages/weather/get_weather.request.dart';
import 'package:messages/weather/get_weather_error.response.dart';

/// This class is a query handler for getting weather by location name.
///
/// It implements the RequestHandler interface, which defines a handle method for processing requests.
/// The handle method takes a GetWeatherRequest object as input and returns an Either object containing either an AbstractErrorResponse or a GetWeatherResponse object.
@injectable
class GetWeatherQueryHandler extends RequestHandler<GetWeatherRequest, GetWeatherResponse> {
  final AbstractWeatherReadableRepository weatherReadableRepository;

  GetWeatherQueryHandler(this.weatherReadableRepository);

  @override
  Future<Either<AbstractErrorResponse, GetWeatherResponse>> handle(GetWeatherRequest request) async {
    final result = await weatherReadableRepository.getWeather(request);
    if (result.statusCode == 200) {
      return Right(GetWeatherResponse.fromJson(jsonDecode(result.body)));
    }
    return Left(GetWeatherErrorResponse(
      title: result.reasonPhrase,
      status: result.statusCode,
      detail: result.body,
    ));
  }
}
