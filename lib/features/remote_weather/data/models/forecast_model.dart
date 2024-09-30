import 'dart:convert';
import 'package:weather_tracker/features/remote_weather/domain/entities/weather_data.dart';
import 'package:weather_tracker/features/remote_weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    super.cityName,
    super.countryCode,
    super.weatherData,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final data = _fillWeatherData(map['data']);

    return WeatherModel(
      cityName: map['city_name'] != null ? map['city_name'] as String : null,
      countryCode:
          map['country_code'] != null ? map['country_code'] as String : null,
      weatherData: data != null
          ? List<WeatherData>.from(
              (data as List<int>).map<WeatherData?>(
                (x) => WeatherData.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  static List<Map<String, dynamic>>? _fillWeatherData(
    Map<String, dynamic> map,
  ) {
    final data = <Map<String, dynamic>>[];
    if (map['data'] == null) return null;
    for (var element in map['data']) {
      data.add(element);
    }
    return data;
  }

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
