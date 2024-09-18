import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:weather_tracker/features/home/adaptive_home_screen.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(milliseconds: 200), () {
    FlutterNativeSplash.remove();
    runApp(const MyWeatherApp());
  });
}

class MyWeatherApp extends StatelessWidget {
  const MyWeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const AdaptiveHomeScreen(),
    );
  }
}
