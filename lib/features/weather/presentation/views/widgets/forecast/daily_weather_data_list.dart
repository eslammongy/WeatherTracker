import 'package:flutter/material.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_data.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/current/daily_weather_item.dart';

class DailyWeatherDataList extends StatelessWidget {
  const DailyWeatherDataList(
      {super.key, required this.dailyList, this.flag = 1});
  final List<WeatherData> dailyList;

  /// this for differentiate between hourly and daily list if flag = 1 this mean we currently display the hourly data
  /// case the flag = 2 this mean we display the daily data
  final int flag;
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
            return DailyWeatherItem(
              weatherData: dailyList[index],
              isHourly: flag == 1,
            );
          },
        ),
      ),
    );
  }
}
