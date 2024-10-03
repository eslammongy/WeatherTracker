import 'package:flutter/foundation.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_data.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    super.cityName,
    super.countryCode,
    super.weatherData,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['city_name'] != null ? json['city_name'] as String : null,
      countryCode:
          json['country_code'] != null ? json['country_code'] as String : null,
      weatherData: json['data'] != null
          ? List<WeatherData>.from(
              (json['data'] as List<dynamic>).map<WeatherData?>(
                (item) => WeatherData.fromMap(
                  item as Map<String, dynamic>,
                ),
              ),
            )
          : null,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherModel &&
        other.cityName == cityName &&
        other.countryCode == countryCode &&
        listEquals(other.weatherData, weatherData);
  }

  @override
  int get hashCode =>
      cityName.hashCode ^ countryCode.hashCode ^ weatherData.hashCode;
}
