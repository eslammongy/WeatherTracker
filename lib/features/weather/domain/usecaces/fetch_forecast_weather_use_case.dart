import 'package:dartz/dartz.dart';
import 'package:weather_tracker/core/error/api_failure.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_tracker/features/weather/domain/repository/weather_repository.dart';

class FetchForecastWeatherUseCase {
  final WeatherRepository weatherRepository;

  FetchForecastWeatherUseCase({required this.weatherRepository});
  Future<Either<Failure, WeatherEntity>> execute({
    required double lat,
    required double lon,
  }) {
    return weatherRepository.fetchForecastWeatherInfo(
      lat: lat,
      lon: lon,
    );
  }
}
