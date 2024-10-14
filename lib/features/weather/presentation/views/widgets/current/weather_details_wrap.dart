import 'package:flutter/material.dart';
import 'package:weather_tracker/core/constants/app_assets.dart';
import 'package:weather_tracker/core/utils/helper.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_data.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/current/view_more_btn.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/current/weather_info_card.dart';

class WeatherDetailsWrap extends StatelessWidget {
  const WeatherDetailsWrap({super.key, required this.weatherData});
  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 10,
      runSpacing: 10,
      children: [
        // Sunrise Info
        WeatherInfoCard(
          iconPath: AppAssets.sunriseIcon,
          title: 'Sunrise',
          value: extractTime(weatherData.sunriseTs),
        ),
        WeatherInfoCard(
          iconPath: AppAssets.sunsetIcon,
          title: 'Sunset',
          value: extractTime(weatherData.sunsetTs),
        ),
        // Wind Speed Info
        WeatherInfoCard(
          iconPath: AppAssets.windSpeed,
          title: 'Wind Speed',
          value: '${weatherData.windSpd} km/h',
        ),
        // Humidity Info
        WeatherInfoCard(
          iconPath: AppAssets.humidity,
          title: 'Humidity',
          value: '${weatherData.humidity} %',
        ),
        WeatherInfoCard(
          iconPath: AppAssets.cloudIcon,
          title: 'Clouds',
          value: '${weatherData.clouds} km/h',
        ),
        ViewMoreBtn(
          width: 125,
          height: 125,
          weatherData: weatherData,
        ),
      ],
    );
  }
}
