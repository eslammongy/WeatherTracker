import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/core/utils/theme_notifier.dart';
import 'package:weather_tracker/core/widgets/app_bar_title.dart';

class WeatherAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WeatherAppBar({super.key, this.onPressed});
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return AppBar(
      backgroundColor: context.theme.appColors.background,
      title: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: appColors.primary),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: AppBarTitle(),
        ),
      ),
      titleSpacing: 0,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(
            themeNotifier.isDarkTheme
                ? Icons.light_mode_rounded
                : Icons.brightness_7_rounded,
          ),
          onPressed: onPressed,
        ),
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
