import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CurrentWeatherContainer extends StatelessWidget {
  const CurrentWeatherContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = context.theme;
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: theme.appColors.surface,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                FontAwesomeIcons.locationDot,
                size: 16,
              ), // Weather Icon
              const SizedBox(
                width: 10,
              ),
              Text(
                "Egypt, ",
                style: AppTextStyles.styleSemiBold30(context),
              ),

              Text(
                "Cairo",
                style: AppTextStyles.styleMedium20(context),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Icon(FontAwesomeIcons.cloudSun, size: 64), // Weather Icon
          const SizedBox(height: 15),
          Text(
            '24°C',
            style: AppTextStyles.styleBold52(context),
          ), // Temp
          const SizedBox(height: 5),
          Text(
            'Sept 17, 2024',
            style: AppTextStyles.styleMedium20(context),
          ), // Date
        ],
      ),
    );
  }
}
