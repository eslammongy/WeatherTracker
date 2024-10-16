import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';

import 'bottom_nav_bar_item.dart';

typedef GetCurrentIndex = void Function(int index);

class FloatingBottomNavBar extends StatelessWidget {
  final Function()? onAddBtnTap;
  final GetCurrentIndex getCurrentIndex;
  final int currentIndex;
  const FloatingBottomNavBar({
    super.key,
    this.onAddBtnTap,
    required this.getCurrentIndex,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          color: appColors.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.3), // Shadow color with transparency
              spreadRadius: 6, // How far the shadow extends
              blurRadius: 4, // Blur effect
              offset: const Offset(1, 1), // Shadow position (x, y)
            )
          ],
        ),
        child: SizedBox(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BottomNavItem(
                title: "Weather",
                icon: FontAwesomeIcons.cloudSun,
                isActive: currentIndex == 0 ? true : false,
                onTap: () {
                  getCurrentIndex(0);
                },
              ),
              BottomNavItem(
                title: "Forecast",
                icon: Icons.thermostat_auto_rounded,
                isActive: currentIndex == 1 ? true : false,
                onTap: () {
                  getCurrentIndex(1);
                },
              ),
              BottomNavItem(
                title: "Search",
                icon: FontAwesomeIcons.magnifyingGlass,
                isActive: currentIndex == 2 ? true : false,
                onTap: () {
                  getCurrentIndex(2);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
