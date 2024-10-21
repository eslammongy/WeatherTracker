import 'package:equatable/equatable.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherLocalEvents extends Equatable {
  const WeatherLocalEvents();
}

class FetchLocalWeatherDataEvent extends WeatherLocalEvents {
  const FetchLocalWeatherDataEvent();

  @override
  List<Object?> get props => [];
}

class SaveWeatherDataLocallyEvent extends WeatherLocalEvents {
  final WeatherEntity entity;
  const SaveWeatherDataLocallyEvent({
    required this.entity,
  });

  @override
  List<Object?> get props => [entity];
}
