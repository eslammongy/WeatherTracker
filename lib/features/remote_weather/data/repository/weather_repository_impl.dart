import 'package:dartz/dartz.dart';
import 'package:weather_tracker/core/error/api_failure.dart';
import 'package:weather_tracker/features/remote_weather/domain/entities/weather_entity.dart';
import 'package:weather_tracker/features/remote_weather/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<Either<Failure, WeatherEntity>> fetchCurrentWeatherInfo() {
    // TODO: implement fetchCurrentWeatherInfo
    throw UnimplementedError();
  }
}
