import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_tracker/core/error/api_failure.dart';
import 'package:weather_tracker/features/weather/data/datasource/local/weather_db_box.dart';
import 'package:weather_tracker/features/weather/data/datasource/remote/weather_api_service.dart';
import 'package:weather_tracker/features/weather/data/repository/weather_repository_impl.dart';

import '../../helpers/dummy/dummy_data.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockWeatherApiServices mockWeatherApiServices;
  late WeatherRepositoryImpl weatherRepositoryImpl;
  late WeatherDbBox weatherDbBox;
  const MethodChannel pathProviderChannel =
      MethodChannel('plugins.flutter.io/path_provider');

  setUp(
    () async {
      // Mock the `getApplicationDocumentsDirectory` method of `path_provider`
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
        pathProviderChannel,
        (methodCall) async {
          if (methodCall.method == 'getApplicationDocumentsDirectory') {
            return '/mockedPath'; // Return a mock directory path
          }
          return null;
        },
      );
      mockWeatherApiServices = MockWeatherApiServices();
      weatherDbBox = await WeatherDbBox.create();
      weatherRepositoryImpl = WeatherRepositoryImpl(
        apiServices: mockWeatherApiServices,
        weatherDbBox: weatherDbBox,
      );
    },
  );

  tearDown(() {
    // Clear the mock after each test
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(pathProviderChannel, null);
  });

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
        (_) async => Response(
          data: testWeatherModel,
          statusCode: 200,
          requestOptions: RequestOptions(path: forecastUrl),
        ),
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

  group("Test Save Weather Data Locally", () {
    test("Test Save Weather Data Locally", () async {
      // arrange

      when(weatherDbBox.weatherBox.putAsync(testWeather))
          .thenAnswer((_) async => 1);
      // act
      final result = await weatherRepositoryImpl.saveWeatherDataLocally(
        entity: testWeather,
      );
      // assertion
      expect(result, equals(const Right(1)));
    });
  });
}
