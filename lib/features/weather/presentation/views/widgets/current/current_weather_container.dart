import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:weather_tracker/core/constants/app_assets.dart';

class CurrentWeatherContainer extends StatelessWidget {
  const CurrentWeatherContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SvgPicture.asset(
                  AppAssets.thunderstorm2,
                  width: 200,
                ), // Weather Icon

                const SizedBox(height: 5),
                _buildTempWidget(context),
                Text(
                  'Sept 17, 2024',
                  style: AppTextStyles.styleMedium20(context),
                ), // Date
              ],
            ),
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

  Row _buildTempWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '24',
          style: AppTextStyles.styleBold52(context).copyWith(fontSize: 72),
        ),
        Text(
          '°C',
          style: AppTextStyles.styleSemiBold30(context),
        ), // Temp
      ],
    );
  }
}
