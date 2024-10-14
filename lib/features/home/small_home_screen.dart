import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/core/utils/internet_checker_service.dart';
import 'package:weather_tracker/core/utils/location_services.dart';
import 'package:weather_tracker/core/widgets/weather_app_bar.dart';
import 'package:weather_tracker/features/home/bottom_nav_bar.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_bloc.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_events.dart';
import 'package:weather_tracker/features/weather/presentation/views/screens/current_weather_screen.dart';
import 'package:weather_tracker/features/weather/presentation/views/screens/forecast_screen.dart';
import 'package:weather_tracker/features/weather/presentation/views/screens/search_for_city_screen.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/location_request_dialog.dart';

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
    setLocationServices(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WeatherAppBar(
        onPressed: () async {
          showLocationRequestDialog(context);
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

  @override
  void dispose() {
    super.dispose();
    InternetConnectivityChecker.dispose();
  }
}
