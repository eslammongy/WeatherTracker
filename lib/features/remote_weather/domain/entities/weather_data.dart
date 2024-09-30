import 'dart:convert';
import 'package:objectbox/objectbox.dart';
import 'package:weather_tracker/features/remote_weather/domain/entities/weather_entity.dart';

@Entity()
class WeatherData {
  int id = 0;
  final double? maxTemp;
  final double? minTemp;
  final int? clouds;
  @Property(type: PropertyType.date)
  final DateTime? datetime;
  final String? icon;
  final String? description;
  final int? code;
  final int? sunriseTs;
  final int? sunsetTs;
  final double? windSpd;
  final double? temp;
  final int? snow;

  final weather = ToOne<WeatherEntity>();

  WeatherData({
    this.maxTemp,
    this.minTemp,
    this.clouds,
    this.datetime,
    this.icon,
    this.description,
    this.code,
    this.sunriseTs,
    this.sunsetTs,
    this.windSpd,
    this.temp,
    this.snow,
  });

  factory WeatherData.fromMap(Map<String, dynamic> map) {
    final weather = map['weather'];
    return WeatherData(
      maxTemp: map['max_temp'] != null ? map['max_temp'] as double : null,
      minTemp: map['min_temp'] != null ? map['min_temp'] as double : null,
      clouds: map['clouds'] != null ? map['clouds'] as int : null,
      datetime: map['datetime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['datetime'] as int)
          : null,
      icon: weather['icon'] != null ? weather['icon'] as String : null,
      description: weather['description'] != null
          ? weather['description'] as String
          : null,
      code: weather['code'] != null ? weather['code'] as int : null,
      sunriseTs: map['sunriseTs'] != null ? map['sunriseTs'] as int : null,
      sunsetTs: map['sunsetTs'] != null ? map['sunsetTs'] as int : null,
      windSpd: map['windSpd'] != null ? map['windSpd'] as double : null,
      temp: map['temp'] != null ? map['temp'] as double : null,
      snow: map['snow'] != null ? map['snow'] as int : null,
    );
  }

  factory WeatherData.fromJson(String source) =>
      WeatherData.fromMap(json.decode(source) as Map<String, dynamic>);
}