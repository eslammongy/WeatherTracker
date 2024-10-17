import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:weather_tracker/core/utils/location_services.dart';
import 'package:weather_tracker/core/widgets/skeleton_list.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_bloc.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/forecast/daily_weather_data_list.dart';

class HourlyWeatherData extends StatelessWidget {
  const HourlyWeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherRemoteBloc = WeatherRemoteBloc.get(context);
    return weatherRemoteBloc.hourlyList.isNotEmpty
        ? DailyWeatherDataList(
            dailyList: weatherRemoteBloc.hourlyList,
          )
        : FutureBuilder(
            future: weatherRemoteBloc.fetchHourlyWeatherData(
              lat: LocationServices.lat!,
              lon: LocationServices.lon!,
            ),
            builder: (context, snapshot) {
              final isLoading =
                  snapshot.connectionState == ConnectionState.waiting;
              final hourlyList = snapshot.data;
              if (isLoading) {
                return const SkeletonList();
              } else if (!isLoading && hourlyList != null) {
                return DailyWeatherDataList(
                  dailyList: hourlyList,
                );
              } else {
                final failure = snapshot.error as DioException;
                return buildErrorStateWidget(failure.message ?? '', context);
              }
            },
          );
  }

  Center buildErrorStateWidget(String msg, BuildContext context) {
    return Center(
      child: Text(
        msg,
        style: AppTextStyles.styleMedium20(context)
            .copyWith(color: context.theme.appColors.error),
      ),
    );
  }
}
