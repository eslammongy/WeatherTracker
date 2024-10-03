import 'package:weather_tracker/features/remote_weather/domain/entities/weather_data.dart';
import 'package:weather_tracker/features/remote_weather/domain/entities/weather_entity.dart';

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
              (json['data'] as List<Map<String, Object?>>).map<WeatherData?>(
                (item) => WeatherData.fromMap(
                  item,
                ),
              ),
            )
          : null,
    );
  }
}
