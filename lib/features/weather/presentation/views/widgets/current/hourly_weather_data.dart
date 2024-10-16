import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:weather_tracker/core/utils/location_services.dart';
import 'package:weather_tracker/core/widgets/skeleton_list.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_data.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_bloc.dart';

import 'hourly_weather_item.dart';

class HourlyWeatherData extends StatelessWidget {
  const HourlyWeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherRemoteBloc = WeatherRemoteBloc.get(context);
    return weatherRemoteBloc.hourlyList.isNotEmpty
        ? buildWeatherDataList(weatherRemoteBloc.hourlyList)
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
                return buildWeatherDataList(hourlyList);
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

  Padding buildWeatherDataList(List<WeatherData> weatherData) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 110.0),
      child: SizedBox(
        height: 160,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: weatherData.length,
          itemBuilder: (context, index) {
            return HourlyWeatherItem(
              weatherData: weatherData[index],
            );
          },
        ),
      ),
    );
  }
}
