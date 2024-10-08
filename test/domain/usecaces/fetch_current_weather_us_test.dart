import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/dummy/dummy_data.dart';
import '../../helpers/test_helper.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_current_weather_use_case.dart';

void main() {
  late FetchCurrentWeatherUseCase fetchCurrentWeatherUseCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    fetchCurrentWeatherUseCase = FetchCurrentWeatherUseCase(
      weatherRepository: mockWeatherRepository,
    );
  });

  test("Test for the fetch current weather use case", () async {
    // Arrange
    const lat = 9090.0;
    const lon = 3333.0;

    when(mockWeatherRepository.fetchCurrentWeatherInfo(lat: lat, lon: lon))
        .thenAnswer((_) async => Right(testWeather));

    // Act
    final result = await fetchCurrentWeatherUseCase.execute(lat: lat, lon: lon);

    // Assert
    expect(result, Right(testWeather));
  });
}
