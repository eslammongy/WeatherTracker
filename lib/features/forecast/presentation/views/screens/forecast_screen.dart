import 'package:flutter/material.dart';
import 'package:weather_tracker/core/utils/animated_dialog.dart';
import 'package:weather_tracker/features/forecast/presentation/views/widgets/forecast_list_item.dart';
import 'package:weather_tracker/features/weather/presentation/views/screens/current_weather_screen.dart';

class ForeCastScreen extends StatelessWidget {
  const ForeCastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 12,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              showAnimatedDialog(
                context,
                title: "Day-12/02/2022",
                body: const CurrentWeatherScreen(),
              );
            },
            child: const ForecastListItem());
      },
    );
  }
}
