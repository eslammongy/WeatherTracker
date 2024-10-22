import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_tracker/core/utils/size_config.dart';
import 'package:weather_tracker/features/home/adaptive_layout.dart';
import 'package:weather_tracker/features/home/large_home_screen.dart';
import 'package:weather_tracker/features/home/medium_home_screen.dart';

class AdaptiveHomeScreen extends StatelessWidget {
  const AdaptiveHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WeatherRemoteBloc(
              fetchHourlyWeather: injector.getIt(),
              fetchForecastWeather: injector.getIt(),
              fetchWeatherByCityName: injector.getIt(),
            ),
          ),
          BlocProvider(
            create: (context) => WeatherLocalBloc(
              saveWeatherLocallyUseCase: injector.getIt(),
              fetchLocallyWeatherUseCase: injector.getIt(),
            ),
          ),
        ],
        child: AdaptiveLayout(
          mobileLayout: (context) => const SmallHomeScreen(),
          tabletLayout: (context) => const MediumHomeScreen(),
          desktopLayout: (context) => const LargeHomeScreen(),
        ),
      ),
    );
  }
}
