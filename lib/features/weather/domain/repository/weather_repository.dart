import 'package:dartz/dartz.dart';
import 'package:weather_tracker/core/error/api_failure.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> fetchCurrentWeatherInfo({
    required double lat,
    required double lon,
  });

  Future<Either<Failure, WeatherEntity>> fetchForecastWeatherInfo({
    required double lat,
    required double lon,
  });
  Future<Either<Failure, WeatherEntity>> fetchWeatherByCityName({
    required String name,
  });
  Future<Either<Failure, int>> saveWeatherDataLocally({
    required WeatherEntity data,
  });
  Future<Either<Failure, List<WeatherEntity>>> fetchLocallyWeatherData();
}
