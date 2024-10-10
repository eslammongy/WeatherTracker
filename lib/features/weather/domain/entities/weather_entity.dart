import 'package:objectbox/objectbox.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_data.dart';

@Entity()
class WeatherEntity {
  @Id()
  int id = 0;
  final String? cityName;
  final String? countryCode;
  @Transient() // This property won't be stored in the ObjectBox database
  final List<WeatherData>? weatherData;

  @Backlink()
  final data = ToMany<WeatherData>();

  WeatherEntity({
    this.cityName,
    this.countryCode,
    this.weatherData,
  });
}
