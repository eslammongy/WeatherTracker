import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';

import 'current_weather_container.dart';
import 'hourly_weather_data.dart';
import 'weather_details_wrap.dart';

class CurrentWeatherInfo extends StatelessWidget {
  const CurrentWeatherInfo({super.key, required this.weatherEntity});
  final WeatherEntity weatherEntity;

  @override
  Widget build(BuildContext context) {
    final currentDay = weatherEntity.weatherData!.first;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CurrentWeatherContainer(
            dateTime: _extractDateTime(currentDay.datetime),
            code: "${currentDay.code}",
            temp: currentDay.temp ?? 0,
            description: currentDay.description ?? "Sunny",
          ),
          const SizedBox(height: 15),
          // Grid for other weather data
          WeatherDetailsWrap(
            weatherData: weatherEntity.weatherData!.first,
          ),
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "hourly",
              style: AppTextStyles.styleSemiBold30(context),
            ),
          ),
          const SizedBox(height: 10),
          const HourlyWeatherData(),
        ],
      ),
    );
  }

  String _extractDateTime(DateTime? dateTime) {
    if (dateTime == null) {
      return "";
    }
    return DateFormat.yMMMMEEEEd().format(dateTime);
  }
}
