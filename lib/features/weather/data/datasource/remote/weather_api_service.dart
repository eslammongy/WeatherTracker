import 'package:dio/dio.dart';
import 'package:weather_tracker/core/api/dio_service.dart';
import 'package:weather_tracker/core/constants/api_constant.dart';
import 'package:weather_tracker/core/error/api_failure.dart';

const forecastUrl =
    "$baseUrl$forecastEndPoint?lat=38.123&lon=-78.543&key=9e602ac39a514d9882058a4f278d124e&days=2";

final badResponseExp = DioException.badResponse(
    requestOptions: RequestOptions(),
    statusCode: 404,
    response: Response(requestOptions: RequestOptions()));

class WeatherApiServices {
  final Dio client;
  WeatherApiServices({required this.client}) {
    DioClient.addInterceptors(client: client);
  }
  Future<Response> getCurrentHourlyWeather({
    required double lat,
    required double lon,
  }) async {
    final hourlyUrl =
        "$baseUrl/forecast/hourly?lat=$lat&lon=$lon&key=$appKey&hours=10";
    try {
      final response = await client.get(hourlyUrl);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw ServerFailure.handleError(badResponseExp);
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<Response> getForecastWeather({
    required double lat,
    required double lon,
  }) async {
    final url =
        "$baseUrl${forecastEndPoint}daily?lat=$lat&lon=$lon&key=$appKey&days=12";

    try {
      final response = await client.get(url);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw ServerFailure.handleError(badResponseExp);
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<Response> getWeatherByCityName({required String name}) async {
    try {
      final response = await client.get(forecastUrl);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw ServerFailure.handleError(badResponseExp);
      }
    } catch (_) {
      rethrow;
    }
  }
}
