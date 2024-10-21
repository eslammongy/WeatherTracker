import 'package:equatable/equatable.dart';
import 'package:weather_tracker/core/error/api_failure.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherLocalStates extends Equatable {
  const WeatherLocalStates();
  @override
  List<Object> get props => [];
}

class WeatherLocalInitialState extends WeatherLocalStates {}

class WeatherLocalLoadingState extends WeatherLocalStates {}

class WeatherLocalFetchedState extends WeatherLocalStates {
  final WeatherEntity weatherEntity;

  const WeatherLocalFetchedState({required this.weatherEntity});
  @override
  List<Object> get props => [weatherEntity];
}

class WeatherLocalSavedState extends WeatherLocalStates {
  @override
  List<Object> get props => [];
}

class WeatherLocalFailureState extends WeatherLocalStates {
  final Failure failure;

  const WeatherLocalFailureState({required this.failure});
  @override
  List<Object> get props => [failure];
}
