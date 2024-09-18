import 'package:flutter/material.dart';
import 'package:weather_tracker/core/utils/size_config.dart';
import 'package:weather_tracker/features/home/adaptive_layout.dart';
import 'package:weather_tracker/features/home/large_home_screen.dart';
import 'package:weather_tracker/features/home/small_home_screen.dart';
import 'package:weather_tracker/features/home/medium_home_screen.dart';

class AdaptiveHomeScreen extends StatelessWidget {
  const AdaptiveHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      appBar: AppBar(),
      body: AdaptiveLayout(
        mobileLayout: (context) => const SmallHomeScreen(),
        tabletLayout: (context) => const MediumHomeScreen(),
        desktopLayout: (context) => const LargeHomeScreen(),
      ),
    );
  }
}
