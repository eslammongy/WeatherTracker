import 'package:flutter/material.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_data.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/current/hourly_weather_item.dart';

class DailyWeatherDataList extends StatelessWidget {
  const DailyWeatherDataList({super.key, required this.dailyList});
  final List<WeatherData> dailyList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 110.0),
      child: SizedBox(
        height: 170,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: dailyList.length,
          itemBuilder: (context, index) {
            return HourlyWeatherItem(
              weatherData: dailyList[index],
            );
          },
        ),
      ),
    );
  }
}
