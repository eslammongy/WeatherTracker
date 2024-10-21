import 'package:dartz/dartz.dart';
import 'package:weather_tracker/core/error/api_failure.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_tracker/features/weather/domain/repository/weather_repository.dart';

class FetchLocallyWeatherUseCase {
  final WeatherRepository weatherRepository;

  FetchLocallyWeatherUseCase({required this.weatherRepository});
  Future<Either<Failure, WeatherEntity>> execute() {
    return weatherRepository.fetchLocallyWeatherData();
  }
}
