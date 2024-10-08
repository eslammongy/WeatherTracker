import 'package:weather_tracker/features/weather/data/models/weather_model.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_data.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';

const dummyJson = {
  "city_name": "Free Union",
  "country_code": "US",
  "data": [
    {
      "max_temp": 22.6,
      "min_temp": 16.2,
      "clouds": 75,
      "datetime": "2024-10-03",
      "weather": {"icon": "r01d", "description": "Light rain", "code": 500},
      "sunrise_ts": 1727953900,
      "sunset_ts": 1727995909,
      "wind_spd": 0.6,
      "temp": 19,
    },
    {
      "max_temp": 24.0,
      "min_temp": 16.4,
      "clouds": 68,
      "datetime": "2024-10-04",
      "weather": {
        "icon": "t03d",
        "description": "Thunderstorm with heavy rain",
        "code": 202
      },
      "sunrise_ts": 1728046498,
      "sunset_ts": 1728086612,
      "wind_spd": 0.8,
      "temp": 19,
    },
  ]
};

final testWeather = WeatherEntity(
  cityName: "Cairo",
  countryCode: "EG",
  weatherData: [
    WeatherData(
      maxTemp: 22.0,
      minTemp: 20.0,
      description: "Cloudy",
      icon: "10d",
      clouds: 11,
      code: 22,
      sunriseTs: 4234235,
      sunsetTs: 5235234,
      temp: 28,
      windSpd: 90.9,
    ),
    WeatherData(
      maxTemp: 22.0,
      minTemp: 20.0,
      description: "Cloudy",
      icon: "10d",
      clouds: 11,
      code: 22,
      sunriseTs: 4234235,
      sunsetTs: 5235234,
      temp: 28,
      windSpd: 90.9,
    ),
  ],
);

final testWeatherModel = WeatherModel(
  cityName: "Cairo",
  countryCode: "EG",
  weatherData: [
    WeatherData(
      maxTemp: 22.0,
      minTemp: 20.0,
      description: "Cloudy",
      icon: "10d",
      clouds: 11,
      code: 22,
      sunriseTs: 4234235,
      sunsetTs: 5235234,
      temp: 28,
      windSpd: 90.9,
    ),
    WeatherData(
      maxTemp: 22.0,
      minTemp: 20.0,
      description: "Cloudy",
      icon: "10d",
      clouds: 11,
      code: 22,
      sunriseTs: 4234235,
      sunsetTs: 5235234,
      temp: 28,
      windSpd: 90.9,
    ),
  ],
);
