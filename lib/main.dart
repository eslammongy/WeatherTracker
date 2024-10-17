import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/features/home/adaptive_home_screen.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_bloc.dart';
import 'package:weather_tracker/service_locator.dart' as injector;

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await injector.initDependencies();
  await Future.delayed(const Duration(milliseconds: 200), () {
    FlutterNativeSplash.remove();
    // runApp(
    //   DevicePreview(
    //     builder: (context) => const MyWeatherApp(),
    //   ),
    // );
    runApp(
      const MyWeatherApp(),
    );
  });
}

class MyWeatherApp extends StatelessWidget {
  const MyWeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherRemoteBloc(
        fetchHourlyWeather: injector.getIt(),
        fetchForecastWeather: injector.getIt(),
        fetchWeatherByCityName: injector.getIt(),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.light,
        home: const AdaptiveHomeScreen(),
      ),
    );
  }
}
