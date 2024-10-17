import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/core/utils/theme_notifier.dart';
import 'package:weather_tracker/features/home/adaptive_home_screen.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_bloc.dart';
import 'package:weather_tracker/service_locator.dart' as injector;

import 'core/utils/user_pref.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await injector.initDependencies();
  await SharedPref.init();
  await runWeatherApp();
}

Future<void> runWeatherApp() async {
  return await Future.delayed(const Duration(milliseconds: 200), () {
    FlutterNativeSplash.remove();
    runApp(ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: const MyWeatherApp(),
    ));
  });
}

class MyWeatherApp extends StatelessWidget {
  const MyWeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return BlocProvider(
          create: (context) => WeatherRemoteBloc(
            fetchHourlyWeather: injector.getIt(),
            fetchForecastWeather: injector.getIt(),
            fetchWeatherByCityName: injector.getIt(),
          ),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeNotifier.themeMode,
            home: const AdaptiveHomeScreen(),
          ),
        );
      },
    );
  }
}
