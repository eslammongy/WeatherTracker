import 'package:dio/dio.dart';
import 'package:weather_tracker/core/fake_data.dart';
import 'package:weather_tracker/core/error/api_failure.dart';
import 'package:weather_tracker/core/constants/api_constant.dart';
import 'package:weather_tracker/features/weather/data/models/weather_model.dart';

const forecastUrl =
    "$baseUrl${forecastEndPoint}daily?lat=38.123&lon=-78.543&key=9e602ac39a514d9882058a4f278d124e&days=2";

final badResponseExp = DioException.badResponse(
    requestOptions: RequestOptions(),
    statusCode: 404,
    response: Response(requestOptions: RequestOptions()));

class WeatherApiServices {
  final Dio client;
  WeatherApiServices({required this.client});
  Future<WeatherModel> getCurrentHourlyWeather({
    required double lat,
    required double lon,
  }) async {
    try {
      final response = await client.get(forecastUrl);
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(dummyJson);
      } else {
        throw ServerFailure.handleError(badResponseExp);
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<WeatherModel> getForecastWeather({
    required double lat,
    required double lon,
  }) async {
    final url =
        "$baseUrl${forecastEndPoint}daily?lat=$lat&lon=$lon&key=$appKey&days=7";

    try {
      final response = await client.get(url);
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(dummyJson);
      } else {
        throw ServerFailure.handleError(badResponseExp);
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<WeatherModel> getWeatherByCityName({required String name}) async {
    try {
      final response = await client.get(forecastUrl);
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(dummyJson);
      } else {
        throw ServerFailure.handleError(badResponseExp);
      }
    } catch (_) {
      rethrow;
    }
  }
}
