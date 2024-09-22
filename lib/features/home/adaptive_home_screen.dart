import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/core/utils/size_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      appBar: AppBar(
        backgroundColor: context.theme.appColors.background,
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.solidSun),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      body: AdaptiveLayout(
        mobileLayout: (context) => const SmallHomeScreen(),
        tabletLayout: (context) => const MediumHomeScreen(),
        desktopLayout: (context) => const LargeHomeScreen(),
      ),
    );
  }
}
