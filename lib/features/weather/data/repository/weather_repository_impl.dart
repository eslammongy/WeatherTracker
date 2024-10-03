import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:weather_tracker/core/error/api_failure.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_tracker/features/weather/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final http.Client client;

  WeatherRepositoryImpl({required this.client});
  @override
  Future<Either<Failure, WeatherEntity>> fetchCurrentWeatherInfo(
      {required double lat, required double lon}) {
    // TODO: implement fetchCurrentWeatherInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, WeatherEntity>> fetchForecastWeatherInfo(
      {required double lat, required double lon}) {
    // TODO: implement fetchForecastWeatherInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, WeatherEntity>> fetchWeatherByCityName(
      {required String name}) {
    // TODO: implement fetchWeatherByCityName
    throw UnimplementedError();
  }
}
