import 'package:dartz/dartz.dart';
import 'package:weather_tracker/core/error/api_failure.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_tracker/features/weather/domain/repository/weather_repository.dart';

class SaveWeatherLocallyUseCase {
  final WeatherRepository weatherRepository;

  SaveWeatherLocallyUseCase({required this.weatherRepository});
  Future<Either<Failure, int>> execute({
    required WeatherEntity entity,
  }) {
    return weatherRepository.saveWeatherDataLocally(entity: entity);
  }
}
import 'package:dartz/dartz.dart';
import 'package:weather_tracker/core/error/api_failure.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_tracker/features/weather/domain/repository/weather_repository.dart';

class SaveWeatherLocallyUseCase {
  final WeatherRepository weatherRepository;

  SaveWeatherLocallyUseCase({required this.weatherRepository});
  Future<Either<Failure, int>> execute({
    required WeatherEntity entity,
  }) {
    return weatherRepository.saveWeatherDataLocally(entity: entity);
  }
}
