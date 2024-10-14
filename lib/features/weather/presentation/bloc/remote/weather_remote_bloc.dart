import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_tracker/features/weather/domain/entities/weather_entity.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_forecast_weather_use_case.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_events.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_states.dart';

class WeatherRemoteBloc extends Bloc<WeatherRemoteEvents, WeatherRemoteStates> {
  final FetchForecastWeatherUseCase fetchForecastWeatherUseCase;
  final WeatherEntity weatherEntity = WeatherEntity();

  static WeatherRemoteBloc get(context) => BlocProvider.of(context);
  WeatherRemoteBloc({
    required this.fetchForecastWeatherUseCase,
  }) : super(WeatherRemoteInitialState()) {
    on<FetchCurrentWeatherEvent>(onFetchCurrentWeatherData);
  }

  onFetchCurrentWeatherData(
    FetchCurrentWeatherEvent event,
    Emitter<WeatherRemoteStates> emit,
  ) async {
    emit(WeatherRemoteLoadingState());
    debugPrint("Result::${event.lat}");
    final result = await fetchForecastWeatherUseCase.execute(
      lat: event.lat,
      lon: event.lon,
    );
    result.fold((failure) {
      debugPrint("Request Failure::$failure");
      emit(WeatherRemoteFailureState(failure: failure));
    }, (data) {
      debugPrint("Request Success::${data.cityName}");
      emit(WeatherRemoteFetchSuccessState(weatherEntity: data));
    });
  }
}
