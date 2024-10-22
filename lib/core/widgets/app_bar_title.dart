import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_tracker/config/theme/app_colors_extension.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:weather_tracker/core/utils/helper.dart';
import 'package:weather_tracker/core/utils/internet_checker_service.dart';
import 'package:weather_tracker/core/widgets/current_location_city.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/local/weather_local_bloc.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_bloc.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_states.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final weatherRemoteBloc = WeatherRemoteBloc.get(context);
    final localWeatherBloc = WeatherLocalBloc.get(context);
    return BlocBuilder<WeatherRemoteBloc, WeatherRemoteStates>(
      builder: (context, state) {
        bool hasSuccessfulRequest = state is WeatherRemoteFetchSuccessState;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              decoration: boxDecoration(context.theme.appColors),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.circle,
                  size: 18,
                  color: InternetConnectivityChecker.hasConnection ||
                          hasSuccessfulRequest
                      ? Colors.green
                      : Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              getLatestUpdate(
                  getWeatherEntity(weatherRemoteBloc, localWeatherBloc)),
              style: AppTextStyles.styleSemiBold18(context),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
                width: width * 0.3,
                height: 45,
                child: CurrentLocationCity(
                  weather:
                      getWeatherEntity(weatherRemoteBloc, localWeatherBloc),
                ))
          ],
        );
      },
    );
  }

  String getLatestUpdate(WeatherEntity? weather) {
    if (weather == null) return "00:00";
    final today = weather.weatherData?.first;
    final lastUpdatedTime =
        extractTime(today!.datetime!.microsecondsSinceEpoch);
    return "last update $lastUpdatedTime";
  }

  BoxDecoration boxDecoration(AppColorEx appColors) {
    return BoxDecoration(
      border: Border.all(width: 2, color: appColors.tertiary),
      borderRadius: const BorderRadius.all(
        Radius.circular(100),
      ),
    );
  }

  WeatherEntity? getWeatherEntity(
    WeatherRemoteBloc remoteWeatherBloc,
    WeatherLocalBloc localWeatherBloc,
  ) {
    final state = remoteWeatherBloc.state;
    if (state is WeatherRemoteFetchSuccessState) {
      return state.weatherEntity;
    } else if (remoteWeatherBloc.weatherEntity != null) {
      return remoteWeatherBloc.weatherEntity!;
    } else if (localWeatherBloc.weatherEntity != null) {
      return localWeatherBloc.weatherEntity!;
    } else {
      return null;
    }
  }
}
