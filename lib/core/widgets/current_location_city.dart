import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';

class CurrentLocationCity extends StatelessWidget {
  const CurrentLocationCity({
    super.key,
    this.weather,
  });
  final WeatherEntity? weather;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (weather != null) {
      return Card(
        color: theme.appColors.primary,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                FontAwesomeIcons.locationDot,
                size: 16,
                color: Colors.white,
              ), // Weather Icon
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  "${weather!.cityName}, ${weather!.countryCode}",
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.styleMedium16(context)
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
