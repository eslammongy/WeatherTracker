import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';

class WeatherInfoCard extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? value;
  final String? iconPath;
  final double width;

  const WeatherInfoCard({
    super.key,
    this.icon,
    required this.title,
    this.value,
    this.iconPath,
    this.width = 125,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 150,
      child: Card(
        color: context.theme.appColors.surface,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconPath == null
                  ? Icon(icon!, size: 35)
                  : SvgPicture.asset(
                      iconPath!,
                      width: 35,
                    ),
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
