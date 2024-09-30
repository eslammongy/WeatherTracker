import 'package:dartz/dartz.dart';
import 'package:weather_tracker/core/error/api_failure.dart';
import 'package:weather_tracker/features/remote_weather/domain/entities/weather_entity.dart';
import 'package:weather_tracker/features/remote_weather/domain/repository/weather_repository.dart';

abstract class FetchCurrentWeatherUseCase {
  final WeatherRepository weatherRepository;

  FetchCurrentWeatherUseCase({required this.weatherRepository});
  Future<Either<Failure, WeatherEntity>> execute() {
    return weatherRepository.fetchCurrentWeatherInfo();
  }
}
