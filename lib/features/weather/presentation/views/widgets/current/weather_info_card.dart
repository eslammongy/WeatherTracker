import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:weather_tracker/core/utils/helper.dart';

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
    return Container(
      width: width,
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.theme.appColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          staticBoxShadow,
        ],
      ),
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
          Text(title,
              maxLines: 1, style: AppTextStyles.styleRegular16(context)),
          const SizedBox(height: 5),
          if (value != null) ...[
            Text(value!, style: AppTextStyles.styleMedium18(context))
          ],
        ],
      ),
    );
  }
}
