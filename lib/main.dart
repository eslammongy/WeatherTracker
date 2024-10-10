import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/features/home/adaptive_home_screen.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(milliseconds: 200), () {
    FlutterNativeSplash.remove();
    runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyWeatherApp(), // Wrap your app
    ));
  });
}

class MyWeatherApp extends StatelessWidget {
  const MyWeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: AppTheme.dark,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      home: const AdaptiveHomeScreen(),
    );
  }
}
