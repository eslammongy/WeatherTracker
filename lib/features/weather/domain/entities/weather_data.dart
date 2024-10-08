import 'package:objectbox/objectbox.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';

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
  final int? temp;
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
      datetime:
          map['datetime'] != null ? DateTime.tryParse(map['datetime']) : null,
      icon: weather['icon'] != null ? weather['icon'] as String : null,
      description: weather['description'] != null
          ? weather['description'] as String
          : null,
      code: weather['code'] != null ? weather['code'] as int : null,
      sunriseTs: map['sunrise_ts'] != null ? map['sunrise_ts'] as int : null,
      sunsetTs: map['sunset_ts'] != null ? map['sunset_ts'] as int : null,
      windSpd: map['wind_spd'] != null ? map['wind_spd'] as double : null,
      temp: map['temp'] != null ? map['temp'] as int : null,
      snow: map['snow'] != null ? map['snow'] as int : null,
    );
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherData &&
        other.maxTemp == maxTemp &&
        other.minTemp == minTemp &&
        other.clouds == clouds &&
        other.datetime == datetime &&
        other.icon == icon &&
        other.description == description &&
        other.code == code &&
        other.sunriseTs == sunriseTs &&
        other.sunsetTs == sunsetTs &&
        other.windSpd == windSpd &&
        other.temp == temp &&
        other.snow == snow;
  }

  @override
  int get hashCode {
    return maxTemp.hashCode ^
        minTemp.hashCode ^
        clouds.hashCode ^
        datetime.hashCode ^
        icon.hashCode ^
        description.hashCode ^
        code.hashCode ^
        sunriseTs.hashCode ^
        sunsetTs.hashCode ^
        windSpd.hashCode ^
        temp.hashCode ^
        snow.hashCode;
  }
}
