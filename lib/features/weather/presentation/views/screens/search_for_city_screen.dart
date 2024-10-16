import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/core/widgets/custom_text_input_filed.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_bloc.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_events.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_states.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/current/current_weather_info.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/current/skeleton_loading_widget.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/forecast/daily_weather_data_list.dart';

import '../../../../../core/widgets/custom_error_widget.dart';

class SearchForCityScreen extends StatelessWidget {
  const SearchForCityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    final weatherRemoteBloc = WeatherRemoteBloc.get(context);
    final theme = context.theme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextInputField(
              textEditingController: searchController,
              height: 55,
              hint: "search for city by name...",
              bkColor: theme.appColors.surface,
              focusColor: theme.appColors.primary,
              prefix: const Icon(FontAwesomeIcons.magnifyingGlass),
              onSubmitted: (text) {
                weatherRemoteBloc.add(FetchCityWeatherEvent(cityName: text!));
              },
            ),
            BlocBuilder<WeatherRemoteBloc, WeatherRemoteStates>(
              builder: (context, state) {
                if (state is WeatherRemoteFetchSuccessState) {
                  return CurrentWeatherInfo(
                    weatherEntity: state.weatherEntity,
                    subViewTitle: "Daily",
                    subView: DailyWeatherDataList(
                        dailyList: state.weatherEntity.weatherData ?? []),
                  );
                } else if (state is WeatherRemoteFailureState) {
                  // should show error message here
                  return CustomErrorWidget(failure: state.failure);
                } else {
                  // should show the loading skeleton here
                  return const SkeletonLoadingWidget();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
