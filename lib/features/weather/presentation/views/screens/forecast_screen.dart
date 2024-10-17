import 'package:flutter/material.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_bloc.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/forecast/forecast_list_item.dart';

class ForeCastScreen extends StatelessWidget {
  const ForeCastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherRemoteBloc = WeatherRemoteBloc.get(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: weatherRemoteBloc.forecastList.length,
        itemBuilder: (context, index) {
          return ForecastListItem(
            weatherData: weatherRemoteBloc.forecastList[index],
          );
        },
      ),
    );
  }
}
