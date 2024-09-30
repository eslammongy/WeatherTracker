import 'package:dartz/dartz.dart';
import 'package:weather_tracker/core/error/api_failure.dart';
import 'package:weather_tracker/features/remote_weather/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> fetchCurrentWeatherInfo();
}
