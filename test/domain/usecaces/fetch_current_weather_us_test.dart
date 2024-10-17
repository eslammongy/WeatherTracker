import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_current_weather_use_case.dart';

import '../../helpers/dummy/dummy_data.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late FetchHourlyWeatherUseCase fetchCurrentWeatherUseCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    fetchCurrentWeatherUseCase = FetchHourlyWeatherUseCase(
      weatherRepository: mockWeatherRepository,
    );
  });

  test("Test for the fetch current weather use case", () async {
    // Arrange
    const lat = 9090.0;
    const lon = 3333.0;

    when(mockWeatherRepository.fetchHourlyWeatherInfo(lat: lat, lon: lon))
        .thenAnswer((_) async => Right(testWeather));

    // Act
    final result = await fetchCurrentWeatherUseCase.execute(lat: lat, lon: lon);

    // Assert
    expect(result, Right(testWeather));
  });
}
