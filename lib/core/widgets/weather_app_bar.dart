import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_tracker/config/theme/app_colors_extension.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:weather_tracker/core/utils/helper.dart';
import 'package:weather_tracker/core/utils/internet_checker_service.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_bloc.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_states.dart';

import 'current_location_city.dart';

class WeatherAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WeatherAppBar({super.key, this.onPressed});

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;

    return AppBar(
      backgroundColor: context.theme.appColors.background,
      title: _buildTitleBox(
        context,
        appColors,
      ),
      titleSpacing: 0,
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(FontAwesomeIcons.solidSun),
          onPressed: onPressed,
        ),
      ],
      centerTitle: true,
    );
  }

  BoxDecoration boxDecoration(AppColorEx appColors) {
    return BoxDecoration(
      border: Border.all(width: 2, color: appColors.tertiary),
      borderRadius: const BorderRadius.all(
        Radius.circular(100),
      ),
    );
  }

  Widget _buildTitleBox(
    BuildContext context,
    AppColorEx appColors,
  ) {
    final width = MediaQuery.sizeOf(context).width;
    final weatherRemoteBloc = WeatherRemoteBloc.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: appColors.primary),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: BlocBuilder<WeatherRemoteBloc, WeatherRemoteStates>(
            builder: (context, state) {
              bool hasSuccessfulRequest =
                  state is WeatherRemoteFetchSuccessState ||
                      weatherRemoteBloc.weatherEntity != null;
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DecoratedBox(
                    decoration: boxDecoration(appColors),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.circle,
                        size: 18,
                        color: InternetConnectivityChecker.hasConnection
                            ? Colors.green
                            : Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  hasSuccessfulRequest
                      ? Text(
                          getLatestUpdate(weatherRemoteBloc.weatherEntity),
                          style: AppTextStyles.styleSemiBold18(context),
                        )
                      : const SizedBox(),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      width: width * 0.3,
                      height: 45,
                      child: CurrentLocationCity(
                        weather: state is WeatherRemoteFetchSuccessState
                            ? state.weatherEntity
                            : weatherRemoteBloc.weatherEntity,
                      ))
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  String getLatestUpdate(WeatherEntity? weather) {
    if (weather == null) return "00:00";
    final today = weather.weatherData?.first;
    final lastUpdatedTime =
        extractTime(today!.datetime!.microsecondsSinceEpoch);
    return "last update $lastUpdatedTime";
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
