import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_tracker/core/widgets/custom_error_widget.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_bloc.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_states.dart';
import 'package:weather_tracker/features/weather/presentation/views/widgets/current/current_weather_info.dart';

import '../widgets/current/skeleton_loading_widget.dart';

class CurrentWeatherScreen extends StatelessWidget {
  const CurrentWeatherScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<WeatherRemoteBloc, WeatherRemoteStates>(
        builder: (context, state) {
          if (state is WeatherRemoteFetchSuccessState) {
            return const CurrentWeatherInfo();
          } else if (state is WeatherRemoteFailureState) {
            // should show error message here
            return CustomErrorWidget(failure: state.failure);
          } else {
            // should show the loading skeleton here
            return const SkeletonLoadingWidget();
          }
        },
      ),
    );
  }
}
