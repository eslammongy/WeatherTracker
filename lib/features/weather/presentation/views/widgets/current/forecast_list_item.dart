import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_tracker/core/constants/app_assets.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/current/view_more_btn.dart';

class ForecastListItem extends StatelessWidget {
  const ForecastListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0, right: 15, left: 15),
        child: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                AppAssets.forecastBK,
                fit: BoxFit.fill,
              ),
            ),
            const Positioned(
              right: 45,
              top: 0,
              child: Icon(
                FontAwesomeIcons.cloud,
                size: 110,
              ),
            ),
            const Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: ViewMoreBtn(
                height: 40,
                width: 40,
                isForecastOpened: true,
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
                          style: AppTextStyles.styleBold52(context),
                        ),
                      ),
                      Text(
                        "H24°C L24°C",
                        style: AppTextStyles.styleRegular16(context),
                      ),
                      Text(
                        "Rain Cloudy",
                        style: AppTextStyles.styleSemiBold18(context),
                      ),
                    ],
                  ),
                  Text(
                    "Rain Cloudy",
                    style: AppTextStyles.styleSemiBold30(context),
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
