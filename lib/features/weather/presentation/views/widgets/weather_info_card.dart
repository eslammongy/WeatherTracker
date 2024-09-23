import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';

class WeatherInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? value;
  final double iconSize;

  const WeatherInfoCard(
      {super.key,
      required this.icon,
      required this.title,
      this.value,
      this.iconSize = 35});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 140,
      child: Card(
        color: context.theme.appColors.surface,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: iconSize),
              const SizedBox(height: 10),
              Text(title, style: AppTextStyles.styleMedium18(context)),
              const SizedBox(height: 5),
              if (value != null) ...[
                Text(value!, style: AppTextStyles.styleMedium18(context))
              ],
            ],
          ),
        ),
      ),
    );
  }
}
