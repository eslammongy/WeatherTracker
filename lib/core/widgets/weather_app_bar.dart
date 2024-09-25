import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_tracker/config/theme/app_colors_extension.dart';

class WeatherAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WeatherAppBar({super.key, this.onPressed});
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;

    return AppBar(
      backgroundColor: context.theme.appColors.background,
      title: _buildTitleWidget(appColors, context),
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

  DecoratedBox _buildTitleWidget(AppColorEx appColors, BuildContext context) {
    var boxDecoration = BoxDecoration(
        border: Border.all(width: 2, color: appColors.tertiary),
        borderRadius: const BorderRadius.all(Radius.circular(100)));
    return DecoratedBox(
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: appColors.tertiary),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              decoration: boxDecoration,
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.circle,
                  size: 18,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "last update 12:00",
              style: AppTextStyles.styleRegular16(context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
