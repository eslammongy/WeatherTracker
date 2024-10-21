import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:weather_tracker/core/constants/app_assets.dart';
import 'package:weather_tracker/core/widgets/custom_text_input_filed.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_bloc.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_events.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_states.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/current/current_weather_info.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/forecast/daily_weather_data_list.dart';

import '../../../../../core/widgets/custom_error_widget.dart';

class SearchForCityScreen extends StatelessWidget {
  const SearchForCityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    final weatherRemoteBloc = WeatherRemoteBloc.get(context);
    searchController.text = weatherRemoteBloc.latestSearchLabel;
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
                if (state is WeatherRemoteSearchState) {
                  return CurrentWeatherInfo(
                    weatherEntity: state.weatherEntity,
                    subViewTitle: "Daily",
                    subView: DailyWeatherDataList(
                      dailyList: state.weatherEntity.weatherData ?? [],
                      flag: 2,
                    ),
                  );
                } else if (state is WeatherRemoteFailureState) {
                  // should show error message here
                  return CustomErrorWidget(failure: state.failure);
                } else if (state is WeatherRemoteLoadingState) {
                  // should show the loading skeleton here
                  return buildLoadingState(context);
                } else {
                  return buildInitState(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInitState(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.2,
        ),
        SvgPicture.asset(
          AppAssets.searchImg,
          width: 300,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "try to write the name of city...",
          style: AppTextStyles.styleSemiBold24(context),
        )
      ],
    );
  }

  Widget buildLoadingState(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 160,
        ),
        Lottie.asset(
          AppAssets.animatedLoading,
          backgroundLoading: false,
        ),
        Text(
          "please waiting...",
          style: AppTextStyles.styleMedium20(context),
        )
      ],
    );
  }
}
