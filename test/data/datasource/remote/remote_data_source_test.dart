import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../helpers/test_helper.mocks.dart';
import 'package:weather_tracker/core/fake_data.dart';
import 'package:weather_tracker/core/error/api_failure.dart';
import 'package:weather_tracker/core/constants/api_constant.dart';
import 'package:weather_tracker/features/weather/data/models/weather_model.dart';
import 'package:weather_tracker/features/weather/data/datasource/remote/weather_api_service.dart';

void main() {
  late MockDio mockDio;
  late WeatherApiServices apiServices;

  setUp(
    () {
      mockDio = MockDio();
      apiServices = WeatherApiServices(client: mockDio);
    },
  );

  group(
    "fetch current city weather data",
    () {
      const lat = 9090.0;
      const lon = 3333.0;
      const url =
          "$baseUrl${forecastEndPoint}daily?lat=$lat&lon=$lon&key=$appKey&days=7";
      test(
        "should return weather model when the response code is 200",
        () async {
          // arrange
          when(
            mockDio.get(url),
          ).thenAnswer(
            (_) async => Response(
              data: dummyJson,
              statusCode: 200,
              requestOptions: RequestOptions(path: url),
            ),
          );

          // act
          final result = await apiServices.getForecastWeather(
            lat: lat,
            lon: lon,
          );

          // assert
          expect(result, isA<WeatherModel>());
        },
      );
      test(
        "should throw an exception when the response code is not 200",
        () async {
          // arrange
          when(
            mockDio.get(url),
          ).thenAnswer(
            (_) async => Response(
              data: "Not found",
              statusCode: 404,
              requestOptions: RequestOptions(path: url),
            ),
          );

          // act & assert
          expectLater(
            () async => await apiServices.getForecastWeather(
              lat: lat,
              lon: lon,
            ),
            throwsA(isA<Failure>()),
          );
        },
      );
    },
  );
}
