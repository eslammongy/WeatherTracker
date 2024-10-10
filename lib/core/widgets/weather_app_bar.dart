import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_tracker/config/theme/app_colors_extension.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';

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

  Widget _buildTitleWidget(AppColorEx appColors, BuildContext context) {
    var boxDecoration = BoxDecoration(
        border: Border.all(width: 2, color: appColors.tertiary),
        borderRadius: const BorderRadius.all(Radius.circular(100)));
    return _buildLastUpdated(appColors, boxDecoration, context);
  }

  DecoratedBox _buildLastUpdated(
      AppColorEx appColors, BoxDecoration boxDecoration, BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: appColors.primary),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
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
              style: AppTextStyles.styleSemiBold18(context),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(width: 100, child: _buildCurrentCityWidget(context))
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentCityWidget(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: theme.appColors.primary,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              FontAwesomeIcons.locationDot,
              size: 16,
              color: Colors.white,
            ), // Weather Icon
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                "Cairo, EG",
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.styleMedium16(context)
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
