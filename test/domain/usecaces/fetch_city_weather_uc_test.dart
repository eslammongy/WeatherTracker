import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/dummy/dummy_data.dart';
import '../../helpers/test_helper.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_city_weather_use_case.dart';

void main() {
  late FetchWeatherByCityNameUseCase fetchWeatherByCityNameUseCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    fetchWeatherByCityNameUseCase = FetchWeatherByCityNameUseCase(
      weatherRepository: mockWeatherRepository,
    );
  });

 
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
