import 'bottom_nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Card(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      elevation: 4,
      color: context.theme.appColors.tertiary,
      shadowColor: Colors.indigo.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BottomNavItem(
              title: "Weather",
              icon: FontAwesomeIcons.cloud,
              isActive: currentIndex == 0 ? true : false,
              onTap: () {
                getCurrentIndex(0);
              },
            ),
            BottomNavItem(
              title: "Forecast",
              icon: FontAwesomeIcons.dailymotion,
              isActive: currentIndex == 1 ? true : false,
              onTap: () {
                getCurrentIndex(1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
