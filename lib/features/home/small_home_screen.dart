import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/core/widgets/weather_app_bar.dart';
import 'package:weather_tracker/features/home/bottom_nav_bar.dart';
import 'package:weather_tracker/core/utils/internet_checker_service.dart';
import 'package:weather_tracker/features/remote_weather/presentation/views/screens/forecast_screen.dart';
import 'package:weather_tracker/features/remote_weather/presentation/views/screens/current_weather_screen.dart';
import 'package:weather_tracker/features/remote_weather/presentation/views/screens/search_for_city_screen.dart';

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
    const SearchForCityScreen(),
  ];

  @override
  void initState() {
    super.initState();
    InternetChecker.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WeatherAppBar(
        onPressed: () {
          debugPrint(
              "Internet Connection Status->${InternetChecker.hasConnection}");
        },
      ),
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

  @override
  void dispose() {
    super.dispose();
    InternetChecker.dispose();
  }
}
