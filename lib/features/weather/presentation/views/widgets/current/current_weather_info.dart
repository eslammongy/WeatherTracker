import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:weather_tracker/core/utils/helper.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';

import 'current_weather_container.dart';
import 'weather_details_wrap.dart';

class CurrentWeatherInfo extends StatelessWidget {
  const CurrentWeatherInfo({
    super.key,
    required this.weatherEntity,
    required this.subViewTitle,
    this.subView,
  });
  final WeatherEntity weatherEntity;
  final String subViewTitle;
  final Widget? subView;

  @override
  Widget build(BuildContext context) {
    final currentDay = weatherEntity.weatherData == null
        ? weatherEntity.data.first
        : weatherEntity.weatherData!.first;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CurrentWeatherContainer(
            dateTime: extractDateTime(currentDay.datetime),
            code: currentDay.code ?? 800,
            temp: currentDay.temp ?? 0,
            description: currentDay.description ?? "Sunny",
          ),
          const SizedBox(height: 15),
          // Grid for other weather data
          WeatherDetailsWrap(
            weatherData: currentDay,
          ),
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              subViewTitle,
              style: AppTextStyles.styleSemiBold30(context),
            ),
          ),
          const SizedBox(height: 10),
          if (subView != null) ...[
            subView!
          ] else ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Text(
                "Sorry, hourly weather data is not available in offline mode.",
                textAlign: TextAlign.center,
                style: AppTextStyles.styleMedium20(context)
                    .copyWith(color: context.theme.appColors.error),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
