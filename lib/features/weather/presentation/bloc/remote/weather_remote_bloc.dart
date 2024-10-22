import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_tracker/core/api/dio_service.dart';
import 'package:weather_tracker/core/error/api_failure.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_data.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_city_weather_use_case.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_current_weather_use_case.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_forecast_weather_use_case.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_events.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_states.dart';

class WeatherRemoteBloc extends Bloc<WeatherRemoteEvents, WeatherRemoteStates> {
  final FetchForecastWeatherUseCase fetchForecastWeather;
  final FetchHourlyWeatherUseCase fetchHourlyWeather;
  final FetchWeatherByCityNameUseCase fetchWeatherByCityName;
  WeatherEntity? weatherEntity;
  final List<WeatherData> forecastList = [];
  List<WeatherData> hourlyList = [];
  String latestSearchLabel = '';

  static WeatherRemoteBloc get(context) => BlocProvider.of(context);
  WeatherRemoteBloc({
    required this.fetchForecastWeather,
    required this.fetchHourlyWeather,
    required this.fetchWeatherByCityName,
  }) : super(WeatherRemoteInitialState()) {
    on<FetchForecastWeatherEvent>(onFetchForecastWeatherData);
    on<FetchCityWeatherEvent>(onFetchCityWeatherData);
  }

  onFetchForecastWeatherData(
    FetchForecastWeatherEvent event,
    Emitter<WeatherRemoteStates> emit,
  ) async {
    emit(WeatherRemoteLoadingState());
    final result = await fetchForecastWeather.execute(
      lat: event.lat,
      lon: event.lon,
    );
    result.fold((failure) {
      _addingFailedRequestToRetryQueue(
        failure,
        FetchForecastWeatherEvent(lon: event.lon, lat: event.lat),
      );
      emit(WeatherRemoteFailureState(failure: failure));
    }, (data) {
      forecastList.addAll(data.weatherData!.skip(1));
      emit(WeatherRemoteFetchSuccessState(weatherEntity: weatherEntity = data));
    });
  }

  Future<List<WeatherData>?> fetchHourlyWeatherData(
      {required double lat, required double lon}) async {
    final result = await fetchHourlyWeather.execute(
      lat: lat,
      lon: lon,
    );
    result.fold((failure) {
      throw DioException(requestOptions: RequestOptions(), error: failure);
    }, (data) {
      hourlyList = data.weatherData ?? [];
    });
    return hourlyList;
  }

  onFetchCityWeatherData(
    FetchCityWeatherEvent event,
    Emitter<WeatherRemoteStates> emit,
  ) async {
    emit(WeatherRemoteLoadingState());
    latestSearchLabel = event.cityName;
    final result = await fetchWeatherByCityName.execute(name: event.cityName);
    result.fold((failure) {
      _addingFailedRequestToRetryQueue(
        failure,
        FetchCityWeatherEvent(cityName: event.cityName),
      );
      emit(WeatherRemoteFailureState(failure: failure));
    }, (data) {
      debugPrint("Request Success::${data.cityName}");
      emit(WeatherRemoteSearchState(weatherEntity: data));
    });
  }

  void _addingFailedRequestToRetryQueue(
      Failure failure, WeatherRemoteEvents event) {
    debugPrint(
        "Adding request to retry queue: ${event.runtimeType}..Failure: ${failure.exceptionType}");
    if (failure.exceptionType == DioExceptionType.connectionError) {
      DioService.addEventToRetryQueue(() => add(event));
    }
  }
}
