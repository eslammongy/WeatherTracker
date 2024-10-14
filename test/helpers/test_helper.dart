import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:weather_tracker/features/weather/data/datasource/local/weather_db_box.dart';
import 'package:weather_tracker/features/weather/data/datasource/remote/weather_api_service.dart';
import 'package:weather_tracker/features/weather/domain/repository/weather_repository.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_city_weather_use_case.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_current_weather_use_case.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_forecast_weather_use_case.dart';

@GenerateMocks(
  [
    WeatherRepository,
    WeatherApiServices,
    Dio,
    WeatherDbBox,
    FetchWeatherByCityNameUseCase,
    FetchForecastWeatherUseCase,
    FetchHourlyWeatherUseCase,
  ],
  customMocks: [
    MockSpec<http.Client>(as: #MockHttpClient),
  ],
)
void main() {}
