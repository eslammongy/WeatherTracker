import 'package:equatable/equatable.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherRemoteStates extends Equatable {
  const WeatherRemoteStates();
  @override
  List<Object> get props => [];
}

class WeatherRemoteInitial extends WeatherRemoteStates {}

class WeatherRemoteLoading extends WeatherRemoteStates {}

class WeatherRemoteFetchSuccess extends WeatherRemoteStates {
  final WeatherEntity weatherEntity;

  const WeatherRemoteFetchSuccess({required this.weatherEntity});
  @override
  List<Object> get props => [weatherEntity];
}

class WeatherRemoteFailure extends WeatherRemoteStates {
  final String message;

  const WeatherRemoteFailure({required this.message});
  @override
  List<Object> get props => [message];
}
