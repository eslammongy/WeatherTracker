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
import 'package:weather_tracker/features/weather/presentation/bloc/local/weather_local_states.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_bloc.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_states.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final localWeatherBloc = WeatherLocalBloc.get(context);
    return BlocBuilder<WeatherRemoteBloc, WeatherRemoteStates>(
      builder: (context, state) {
        bool hasSuccessfulRequest = state is WeatherRemoteFetchSuccessState;
        if (state is WeatherRemoteFetchSuccessState) {
          return buildBarTitleRow(
            context,
            state.weatherEntity!,
            hasSuccessfulRequest,
            width,
          );
        } else if (state is WeatherRemoteFailureState) {
          return buildBarTitleRow(
            context,
            localWeatherBloc.weatherEntity,
            false,
            width,
          );
        } else {
          return buildBarTitleRow(
            context,
            WeatherEntity(),
            hasSuccessfulRequest,
            width,
          );
        }
      },
    );
  }

  Widget buildBarTitleRow(
    BuildContext context,
    WeatherEntity? entity,
    bool hasSuccessfulRequest,
    double width,
  ) {
    final remoteWeatherBloc = WeatherRemoteBloc.get(context);
    return BlocBuilder<WeatherLocalBloc, WeatherLocalStates>(
      builder: (context, state) {
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
                remoteWeatherBloc,
                state,
              ),
              style: AppTextStyles.styleSemiBold18(context),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
                width: width * 0.3,
                height: 45,
                child: CurrentLocationCity(
                  weather: getWeatherEntity(
                    remoteWeatherBloc,
                    state,
                  ),
                ))
          ],
        );
      },
    );
  }

  String getLatestUpdate(
    WeatherRemoteBloc remoteWeatherBloc,
    WeatherLocalStates localState,
  ) {
    final today = getWeatherEntity(remoteWeatherBloc, localState);
    String lastUpdatedTime = "00:00";
    if (today.data.isEmpty) {
      final firstDay =
          today.weatherData?.first.datetime!.microsecondsSinceEpoch;
      lastUpdatedTime = extractTime(firstDay);
    } else if (today.data.isNotEmpty) {
      final firstDay = today.data?.first.datetime!.microsecondsSinceEpoch;
      lastUpdatedTime = extractTime(firstDay);
    }
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

  WeatherEntity getWeatherEntity(
    WeatherRemoteBloc remoteWeatherBloc,
    WeatherLocalStates localState,
  ) {
    if (remoteWeatherBloc.weatherEntity != null) {
      return remoteWeatherBloc.weatherEntity!;
    } else if (localState is WeatherLocalFetchedState) {
      return localState.weatherEntity;
    } else {
      return WeatherEntity();
    }
  }
}
