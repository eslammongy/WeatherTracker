import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:weather_tracker/core/constants/app_assets.dart';

class ForecastListItem extends StatelessWidget {
  const ForecastListItem({
    super.key,
  });

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
                AppAssets.thunderstorm2,
                fit: BoxFit.contain,
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
                          "24°C",
                          style: AppTextStyles.styleBold52(context)
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      Text(
                        "H24°C L24°C",
                        style: AppTextStyles.styleRegular16(context)
                            .copyWith(color: context.theme.appColors.tertiary),
                      ),
                      Text(
                        "Rain Cloudy",
                        style: AppTextStyles.styleSemiBold18(context)
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  Text(
                    "Rain Cloudy",
                    style: AppTextStyles.styleSemiBold30(context)
                        .copyWith(color: Colors.white),
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
