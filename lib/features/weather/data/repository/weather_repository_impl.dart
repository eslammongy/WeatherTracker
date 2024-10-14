import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_tracker/core/error/api_failure.dart';
import 'package:weather_tracker/features/weather/data/datasource/local/weather_db_box.dart';
import 'package:weather_tracker/features/weather/data/datasource/remote/weather_api_service.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_tracker/features/weather/domain/repository/weather_repository.dart';

final connectionExp = DioException.connectionError(
  requestOptions: RequestOptions(),
  reason:
      'There is an exception happened when connecting to the server, please check your internet connection',
);

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiServices apiServices;
  final WeatherDbBox weatherDbBox;

  WeatherRepositoryImpl({
    required this.apiServices,
    required this.weatherDbBox,
  });
  @override
  Future<Either<ServerFailure, WeatherEntity>> fetchHourlyWeatherInfo({
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

  @override
  Future<Either<Failure, List<WeatherEntity>>> fetchLocallyWeatherData() async {
    try {
      final result = await weatherDbBox.weatherBox.getAllAsync();
      if (result.isEmpty) {
        return Left(
            DBFailure(message: "There no data saved in local database"));
      } else {
        return Right(result);
      }
    } catch (e) {
      return Left(DBFailure(message: "$e"));
    }
  }

  @override
  Future<Either<Failure, int>> saveWeatherDataLocally({
    required WeatherEntity data,
  }) async {
    try {
      final result = await weatherDbBox.weatherBox.putAsync(data);
      return Right(result);
    } catch (e) {
      return Left(DBFailure(message: "$e"));
    }
  }
}
