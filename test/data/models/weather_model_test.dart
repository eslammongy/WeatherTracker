import 'package:flutter_test/flutter_test.dart';
import 'package:weather_tracker/features/weather/data/models/weather_model.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_data.dart';

import '../../helpers/dummy/dummy_data.dart';

void main() {
  final testWeather = WeatherModel(
    cityName: "Free Union",
    countryCode: "US",
    weatherData: [
      WeatherData(
        maxTemp: 22,
        minTemp: 16,
        description: "Light rain",
        icon: "r01d",
        clouds: 75,
        code: 500,
        sunriseTs: 1727953900,
        sunsetTs: 1727995909,
        temp: 19,
        windSpd: 0.6,
        datetime: DateTime.tryParse("2024-10-03"),
      ),
      WeatherData(
        maxTemp: 24,
        minTemp: 16,
        description: "Thunderstorm with heavy rain",
        icon: "t03d",
        clouds: 68,
        code: 202,
        sunriseTs: 1728046498,
        sunsetTs: 1728086612,
        temp: 19,
        windSpd: 0.8,
        datetime: DateTime.tryParse("2024-10-04"),
      ),
    ],
  );
  test(
    "Test Weather Model Is A Subclass For Weather Entity",
    () {
      // arrange
      const jsonData = dummyJson;

      // act
      final result = WeatherModel.fromJson(jsonData);

      // assert
      expect(result, equals(testWeather));
    },
  );
}
