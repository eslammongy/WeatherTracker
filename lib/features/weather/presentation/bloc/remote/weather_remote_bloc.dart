import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_data.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_city_weather_use_case.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_current_weather_use_case.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_forecast_weather_use_case.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_events.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_states.dart';

class WeatherRemoteBloc extends Bloc<WeatherRemoteEvents, WeatherRemoteStates> {
  final FetchForecastWeatherUseCase fetchForecastWeather;
  final FetchHourlyWeatherUseCase fetchHourlyWeather;
  final FetchWeatherByCityNameUseCase fetchWeatherByCityName;
  final List<WeatherData> forecastList = [];

  static WeatherRemoteBloc get(context) => BlocProvider.of(context);
  WeatherRemoteBloc({
    required this.fetchForecastWeather,
    required this.fetchHourlyWeather,
    required this.fetchWeatherByCityName,
  }) : super(WeatherRemoteInitialState()) {
    on<FetchHourlyWeatherEvent>(onFetchHourlyWeatherData);
    on<FetchForecastWeatherEvent>(onFetchForecastWeatherData);
    on<FetchCityWeatherEvent>(onFetchCityWeatherData);
  }

  onFetchHourlyWeatherData(
    FetchHourlyWeatherEvent event,
    Emitter<WeatherRemoteStates> emit,
  ) async {
    emit(WeatherRemoteLoadingState());
    final result = await fetchHourlyWeather.execute(
      lat: event.lat,
      lon: event.lon,
    );
    result.fold((failure) {
      debugPrint("Request Failure::$failure");
      emit(WeatherRemoteFailureState(failure: failure));
    }, (data) {
      debugPrint("Request Success::${data.cityName}");
      emit(WeatherRemoteFetchSuccessState(weatherEntity: data));
    });
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
      emit(WeatherRemoteFailureState(failure: failure));
    }, (data) {
      forecastList.addAll(data.weatherData!);
      emit(WeatherRemoteFetchSuccessState(weatherEntity: data));
    });
  }

  onFetchCityWeatherData(
    FetchCityWeatherEvent event,
    Emitter<WeatherRemoteStates> emit,
  ) async {
    emit(WeatherRemoteLoadingState());
    final result = await fetchWeatherByCityName.execute(name: event.cityName);
    result.fold((failure) {
      debugPrint("Request Failure::$failure");
      emit(WeatherRemoteFailureState(failure: failure));
    }, (data) {
      debugPrint("Request Success::${data.cityName}");
      emit(WeatherRemoteFetchSuccessState(weatherEntity: data));
    });
  }
}
