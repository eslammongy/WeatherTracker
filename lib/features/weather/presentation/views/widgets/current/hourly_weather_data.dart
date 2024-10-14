import 'package:flutter/material.dart';

import 'hourly_weather_item.dart';

class HourlyWeatherData extends StatelessWidget {
  const HourlyWeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 110.0),
      child: SizedBox(
        height: 160,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const HourlyWeatherItem();
          },
        ),
      ),
    );
  }
}
