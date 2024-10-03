import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/test_helper.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_tracker/features/remote_weather/domain/entities/weather_data.dart';
import 'package:weather_tracker/features/remote_weather/domain/entities/weather_entity.dart';
import 'package:weather_tracker/features/remote_weather/domain/usecaces/fetch_city_weather_use_case.dart';

void main() {
  late FetchWeatherByCityNameUseCase fetchWeatherByCityNameUseCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    fetchWeatherByCityNameUseCase = FetchWeatherByCityNameUseCase(
      weatherRepository: mockWeatherRepository,
    );
  });

  final testWeather = WeatherEntity(
    cityName: "Cairo",
    countryCode: "EG",
    weatherData: [
      WeatherData(
        maxTemp: 22.0,
        minTemp: 20.0,
        description: "Cloudy",
        icon: "10d",
        clouds: 11,
        code: 22,
        sunriseTs: 4234235,
        sunsetTs: 5235234,
        temp: 28,
        windSpd: 90.9,
      ),
      WeatherData(
        maxTemp: 22.0,
        minTemp: 20.0,
        description: "Cloudy",
        icon: "10d",
        clouds: 11,
        code: 22,
        sunriseTs: 4234235,
        sunsetTs: 5235234,
        temp: 28,
        windSpd: 90.9,
      ),
    ],
  );

  test("Test for the fetch current weather by city name use case", () async {
    // Arrange
    const cityName = "Cairo";

    when(mockWeatherRepository.fetchWeatherByCityName(name: cityName))
        .thenAnswer((_) async => Right(testWeather));

    // Act
    final result = await fetchWeatherByCityNameUseCase.execute(name: cityName);

    // Assert
    expect(result, Right(testWeather));
  });
}
