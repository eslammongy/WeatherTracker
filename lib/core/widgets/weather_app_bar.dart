import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_tracker/config/theme/app_colors_extension.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:weather_tracker/core/utils/internet_checker_service.dart';

import 'current_location_city.dart';

class WeatherAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WeatherAppBar({super.key, this.onPressed});

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;

    return AppBar(
      backgroundColor: context.theme.appColors.background,
      title: _buildTitleBox(
        context,
        appColors,
      ),
      titleSpacing: 0,
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(FontAwesomeIcons.solidSun),
          onPressed: onPressed,
        ),
      ],
      centerTitle: true,
    );
  }

  BoxDecoration boxDecoration(AppColorEx appColors) {
    return BoxDecoration(
      border: Border.all(width: 2, color: appColors.tertiary),
      borderRadius: const BorderRadius.all(
        Radius.circular(100),
      ),
    );
  }

  Widget _buildTitleBox(
    BuildContext context,
    AppColorEx appColors,
  ) {
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: appColors.primary),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DecoratedBox(
                decoration: boxDecoration(appColors),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.circle,
                    size: 18,
                    color: InternetConnectivityChecker.hasConnection
                        ? Colors.green
                        : Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "last update 00:00",
                style: AppTextStyles.styleSemiBold18(context),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(width: width * 0.4, child: const CurrentLocationCity())
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
