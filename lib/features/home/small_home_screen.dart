import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/core/utils/internet_checker_service.dart';
import 'package:weather_tracker/core/utils/location_services.dart';
import 'package:weather_tracker/core/utils/theme_notifier.dart';
import 'package:weather_tracker/core/utils/user_pref.dart';
import 'package:weather_tracker/core/widgets/weather_app_bar.dart';
import 'package:weather_tracker/features/home/bottom_nav_bar.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_bloc.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_events.dart';
import 'package:weather_tracker/features/weather/presentation/views/screens/forecast_screen.dart';
import 'package:weather_tracker/features/weather/presentation/views/screens/search_for_city_screen.dart';
import 'package:weather_tracker/features/weather/presentation/views/screens/today_weather_screen.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/location_request_dialog.dart';

class SmallHomeScreen extends StatefulWidget {
  const SmallHomeScreen({super.key});

  @override
  State<SmallHomeScreen> createState() => _SmallHomeScreenState();
}

class _SmallHomeScreenState extends State<SmallHomeScreen> {
  bool isDarkMode = true;
  int currentIndex = 0;
  final screens = [
    const TodayWeatherScreen(),
    const ForeCastScreen(),
    const SearchForCityScreen(),
  ];

  @override
  void initState() {
    super.initState();
    setLocationServices(context);
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: WeatherAppBar(
        onPressed: () async {
          await setAppPreferenceTheme(themeNotifier);
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

  setLocationServices(BuildContext context) async {
    LocationServices.onDenied = () => showLocationRequestDialog(context);
    await LocationServices.initLocationServices();
    LocationServices.callback = (lat, lon) {
      WeatherRemoteBloc.get(context).add(
        FetchForecastWeatherEvent(lat: lat, lon: lon),
      );
    };
  }

  Future<void> setAppPreferenceTheme(ThemeNotifier themeNotifier) async {
    if (themeNotifier.isDarkTheme) {
      await SharedPref.saveSelectedAppTheme(ThemeModes.lightTheme);
      themeNotifier.toggleTheme(ThemeMode.light);
    } else {
      await SharedPref.saveSelectedAppTheme(ThemeModes.darkTheme);
      themeNotifier.toggleTheme(ThemeMode.dark);
    }
  }

  @override
  void dispose() {
    super.dispose();
    InternetConnectivityChecker.dispose();
  }
}
