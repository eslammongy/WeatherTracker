import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:weather_tracker/core/constants/app_assets.dart';

class CurrentWeatherContainer extends StatelessWidget {
  const CurrentWeatherContainer({
    super.key,
    required this.dateTime,
    required this.description,
    required this.temp,
    required this.code,
  });
  final String dateTime;
  final String description;
  final int temp;
  final String code;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: _buildTempWidget(context),
          ),
        ),
        Positioned.fill(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Opacity(
              opacity: 0.1, child: SvgPicture.asset(AppAssets.thunderstorm2)),
        )),
      ],
    );
  }

  Widget _buildTempWidget(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          AppAssets.thunderstorm2,
          width: 200,
        ), // Weather Icon
        const SizedBox(height: 10),
        Text(
          "$temp°",
          style: AppTextStyles.styleBold52(context)
              .copyWith(fontSize: 72, height: 0.9),
        ),
        Text(
          description,
          style: AppTextStyles.styleBold40(context),
        ), // Temp
        Text(
          dateTime,
          style: AppTextStyles.styleMedium20(context),
        ),
      ],
    );
  }
}
