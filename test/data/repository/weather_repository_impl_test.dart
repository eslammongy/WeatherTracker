import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/dummy/dummy_data.dart';
import '../../helpers/test_helper.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_tracker/core/error/api_failure.dart';
import 'package:weather_tracker/features/weather/data/repository/weather_repository_impl.dart';

void main() {
  late MockWeatherApiServices mockWeatherApiServices;
  late WeatherRepositoryImpl weatherRepositoryImpl;

  setUp(
    () {
      mockWeatherApiServices = MockWeatherApiServices();
      weatherRepositoryImpl =
          WeatherRepositoryImpl(apiServices: mockWeatherApiServices);
    },
  );

  group("fetch Forecast Weather info", () {
    const lat = 9090.0;
    const lon = 3333.0;

    test("test fetch current forecast weather data with success case",
        () async {
      // arrange
      when(mockWeatherApiServices.getForecastWeather(
        lat: lat,
        lon: lon,
      )).thenAnswer(
        (_) async => testWeatherModel,
      );
      // act
      final result = await weatherRepositoryImpl.fetchForecastWeatherInfo(
        lat: lat,
        lon: lon,
      );
      // assertion
      expect(result, equals(Right(testWeatherModel)));
    });

    test(
      "test fetch current forecast weather data with fail connection case",
      () async {
        // arrange
        when(mockWeatherApiServices.getForecastWeather(
          lat: lat,
          lon: lon,
        )).thenThrow(
          ServerFailure(),
        );

        expectLater(
          // act
          () async => await weatherRepositoryImpl.fetchForecastWeatherInfo(
            lat: lat,
            lon: lon,
          ),
          // assertion
          throwsA(isA<ServerFailure>()),
        );
      },
    );
  });
}
