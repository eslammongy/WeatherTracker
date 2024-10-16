import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:weather_tracker/core/utils/helper.dart';
import 'package:weather_tracker/core/utils/status_icon_helper.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_data.dart';

class DailyWeatherItem extends StatelessWidget {
  const DailyWeatherItem({
    super.key,
    required this.weatherData,
    this.isHourly = true,
  });
  final WeatherData weatherData;
  final bool isHourly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: isHourly ? 120 : 160,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: context.theme.appColors.surface,
            boxShadow: [
              staticBoxShadow,
            ],
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              isHourly
                  ? extractTime(weatherData.datetime?.microsecondsSinceEpoch)
                  : DateFormat('MMMM d, yyyy').format(weatherData.datetime!),
              style: AppTextStyles.styleSemiBold20(context),
            ),
            const SizedBox(height: 10),
            SvgPicture.asset(
              StatusIconHelper.getWeatherIcon(code: weatherData.code ?? 800),
              width: 60,
            ),
            const SizedBox(height: 10),
            Text(
              '${weatherData.temp}°C',
              style: AppTextStyles.styleSemiBold24(context),
            ),
          ],
        ),
      ),
    );
  }
}
