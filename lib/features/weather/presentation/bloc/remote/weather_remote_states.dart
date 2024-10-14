import 'package:equatable/equatable.dart';
import 'package:weather_tracker/core/error/api_failure.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherRemoteStates extends Equatable {
  const WeatherRemoteStates();
  @override
  List<Object> get props => [];
}

class WeatherRemoteInitialState extends WeatherRemoteStates {}

class WeatherRemoteLoadingState extends WeatherRemoteStates {}

class WeatherRemoteFetchSuccessState extends WeatherRemoteStates {
  final WeatherEntity weatherEntity;

  const WeatherRemoteFetchSuccessState({required this.weatherEntity});
  @override
  List<Object> get props => [weatherEntity];
}

class WeatherRemoteFailureState extends WeatherRemoteStates {
  final Failure failure;

  const WeatherRemoteFailureState({required this.failure});
  @override
  List<Object> get props => [failure];
}
