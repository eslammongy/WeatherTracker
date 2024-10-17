import 'package:equatable/equatable.dart';

abstract class WeatherRemoteEvents extends Equatable {
  const WeatherRemoteEvents();
}

class FetchHourlyWeatherEvent extends WeatherRemoteEvents {
  final double lat;
  final double lon;
  const FetchHourlyWeatherEvent({
    required this.lat,
    required this.lon,
  });

  @override
  List<Object?> get props => [lat, lon];
}

class FetchCityWeatherEvent extends WeatherRemoteEvents {
  final String cityName;
  const FetchCityWeatherEvent({
    required this.cityName,
  });

  @override
  List<Object?> get props => [cityName];
}

class FetchForecastWeatherEvent extends WeatherRemoteEvents {
  final double lat;
  final double lon;
  const FetchForecastWeatherEvent({
    required this.lat,
    required this.lon,
  });

  @override
  List<Object?> get props => [lat, lon];
}
