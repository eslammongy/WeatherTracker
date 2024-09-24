import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/hourly_weather_item.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/weather_details_wrap.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/current_weather_conatiner.dart';

class CurrentWeatherScreen extends StatelessWidget {
  const CurrentWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CurrentWeatherContainer(),
            const SizedBox(height: 15),
            // Grid for other weather data
            const WeatherDetailsWrap(),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "hourly",
                style: AppTextStyles.styleSemiBold30(context),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
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
            )
          ],
        ),
      ),
    );
  }
}
