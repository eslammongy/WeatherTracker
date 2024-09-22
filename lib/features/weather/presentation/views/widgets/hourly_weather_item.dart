import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HourlyWeatherItem extends StatelessWidget {
  const HourlyWeatherItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Card(
        color: context.theme.appColors.surface,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("12:00", style: AppTextStyles.styleMedium18(context)),
              const Icon(FontAwesomeIcons.cloudRain, size: 40),
              const SizedBox(height: 10),
              Text('24°C', style: AppTextStyles.styleMedium18(context)),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
