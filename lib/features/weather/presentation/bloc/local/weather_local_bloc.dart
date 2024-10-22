import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_data.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_locally_weather_use_case.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/save_weather_locally_use_case.dart';

import 'weather_local_events.dart';
import 'weather_local_states.dart';

class WeatherLocalBloc extends Bloc<WeatherLocalEvents, WeatherLocalStates> {
  final SaveWeatherLocallyUseCase saveWeatherLocallyUseCase;
  final FetchLocallyWeatherUseCase fetchLocallyWeatherUseCase;
  WeatherEntity? weatherEntity;
  final List<WeatherData> forecastList = [];

  static WeatherLocalBloc get(context) => BlocProvider.of(context);
  WeatherLocalBloc({
    required this.saveWeatherLocallyUseCase,
    required this.fetchLocallyWeatherUseCase,
  }) : super(WeatherLocalInitialState()) {
    on<SaveWeatherDataLocallyEvent>(onSaveWeatherDataLocally);
    on<FetchLocalWeatherDataEvent>(onFetchLocallyWeather);
  }

  onSaveWeatherDataLocally(
    SaveWeatherDataLocallyEvent event,
    Emitter<WeatherLocalStates> emit,
  ) async {
    final result =
        await saveWeatherLocallyUseCase.execute(entity: event.entity);
    result.fold((failure) {
      emit(WeatherLocalFailureState(failure: failure));
    }, (data) {
      debugPrint("Offline data updated...");
      emit(WeatherLocalSavedState());
    });
  }

  onFetchLocallyWeather(
    FetchLocalWeatherDataEvent event,
    Emitter<WeatherLocalStates> emit,
  ) async {
    final result = await fetchLocallyWeatherUseCase.execute();
    result.fold((failure) {
      emit(WeatherLocalFailureState(failure: failure));
    }, (entity) {
      forecastList.addAll(entity.data);
      emit(WeatherLocalFetchedState(weatherEntity: weatherEntity = entity));
    });
  }
}
