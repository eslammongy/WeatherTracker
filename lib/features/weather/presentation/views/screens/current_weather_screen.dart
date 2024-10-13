import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_bloc.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_states.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/current/current_weather_container.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/current/hourly_weather_data.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/current/weather_details_wrap.dart';

class CurrentWeatherScreen extends StatelessWidget {
  const CurrentWeatherScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<WeatherRemoteBloc, WeatherRemoteStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
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
                const HourlyWeatherData(),
              ],
            ),
          );
        },
      ),
    );
  }
}
