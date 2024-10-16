import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:weather_tracker/core/constants/app_assets.dart';
import 'package:weather_tracker/core/utils/status_icon_helper.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_data.dart';

class ForecastListItem extends StatelessWidget {
  const ForecastListItem({
    super.key,
    required this.weatherData,
  });

  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0, right: 10, left: 10),
        child: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                AppAssets.forecastBK,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              right: 45,
              top: 0,
              child: SvgPicture.asset(
                StatusIconHelper.getWeatherIcon(code: weatherData.code ?? 800),
                width: 120,
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 10,
              top: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Text(
                          "${weatherData.temp}°",
                          style: AppTextStyles.styleBold52(context)
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      Text(
                        "H${weatherData.maxTemp}°C L${weatherData.minTemp}°C",
                        style: AppTextStyles.styleRegular16(context)
                            .copyWith(color: context.theme.appColors.tertiary),
                      ),
                      Text(
                        DateFormat('MMMM d, yyyy')
                            .format(weatherData.datetime ?? DateTime.now()),
                        style: AppTextStyles.styleRegular16(context)
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        weatherData.description ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.styleSemiBold30(context)
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
