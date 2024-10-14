import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/text_style.dart';

import 'current_weather_container.dart';
import 'hourly_weather_data.dart';
import 'weather_details_wrap.dart';

class CurrentWeatherInfo extends StatelessWidget {
  const CurrentWeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CurrentWeatherContainer(),
          const SizedBox(height: 15),
          // Grid for other weather data
          const WeatherDetailsWrap(),
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
}
