import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/features/home/bottom_nav_bar.dart';
import 'package:weather_tracker/features/forecast/presentation/views/screens/forecast_screen.dart';
import 'package:weather_tracker/features/weather/presentation/views/screens/current_weather_screen.dart';

class SmallHomeScreen extends StatefulWidget {
  const SmallHomeScreen({super.key});

  @override
  State<SmallHomeScreen> createState() => _SmallHomeScreenState();
}

class _SmallHomeScreenState extends State<SmallHomeScreen> {
  bool isDarkMode = false;
  int currentIndex = 0;
  final screens = [
    const CurrentWeatherScreen(),
    const ForeCastScreen(),
  ];

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.appColors.background,
      body: screens[currentIndex],
      extendBody: true,
      bottomNavigationBar: FloatingBottomNavBar(
        currentIndex: currentIndex,
        getCurrentIndex: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
