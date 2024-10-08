import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_tracker/core/error/api_failure.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_tracker/features/weather/domain/repository/weather_repository.dart';
import 'package:weather_tracker/features/weather/data/datasource/remote/weather_api_service.dart';

final connectionExp = DioException.connectionError(
  requestOptions: RequestOptions(),
  reason:
      'There is an exception happened when connecting to the server, please check your internet connection',
);

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiServices apiServices;

  WeatherRepositoryImpl({required this.apiServices});
  @override
  Future<Either<ServerFailure, WeatherEntity>> fetchCurrentWeatherInfo({
    required double lat,
    required double lon,
  }) async {
    try {
      final result = await apiServices.getCurrentHourlyWeather(
        lat: lat,
        lon: lon,
      );
      return Right(result);
    } on DioException catch (dioExp) {
      return Left(ServerFailure.handleError(dioExp));
    } on SocketException catch (_) {
      return Left(ServerFailure.handleError(connectionExp));
    }
  }

  @override
  Future<Either<ServerFailure, WeatherEntity>> fetchForecastWeatherInfo({
    required double lat,
    required double lon,
  }) async {
    try {
      final result = await apiServices.getForecastWeather(
        lat: lat,
        lon: lon,
      );
      return Right(result);
    } on DioException catch (dioExp) {
      return Left(ServerFailure.handleError(dioExp));
    } on SocketException catch (_) {
      return Left(ServerFailure.handleError(connectionExp));
    }
  }

  @override
  Future<Either<ServerFailure, WeatherEntity>> fetchWeatherByCityName({
    required String name,
  }) async {
    try {
      final result = await apiServices.getWeatherByCityName(name: name);
      return Right(result);
    } on DioException catch (dioExp) {
      return Left(ServerFailure.handleError(dioExp));
    } on SocketException catch (_) {
      return Left(ServerFailure.handleError(connectionExp));
    }
  }
}
