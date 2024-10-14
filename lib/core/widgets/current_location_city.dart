import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_tracker/config/theme/app_theme.dart';
import 'package:weather_tracker/config/theme/text_style.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_bloc.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_states.dart';

class CurrentLocationCity extends StatelessWidget {
  const CurrentLocationCity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<WeatherRemoteBloc, WeatherRemoteStates>(
      builder: (context, state) {
        if (state is WeatherRemoteFetchSuccessState) {
          final weather = state.weatherEntity;
          return Card(
            color: theme.appColors.primary,
            margin: EdgeInsets.zero,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    FontAwesomeIcons.locationDot,
                    size: 16,
                    color: Colors.white,
                  ), // Weather Icon
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      "${weather.cityName}, ${weather.countryCode}",
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.styleMedium16(context)
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
