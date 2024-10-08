import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_events.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_states.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_forecast_weather_use_case.dart';

class WeatherRemoteBloc extends Bloc<WeatherRemoteEvents, WeatherRemoteStates> {
  final FetchForecastWeatherUseCase fetchForecastWeatherUseCase;

  WeatherRemoteBloc({
    required this.fetchForecastWeatherUseCase,
  }) : super(WeatherRemoteInitial()) {
    on<FetchCurrentWeatherEvent>(onFetchCurrentWeatherData);
  }

  onFetchCurrentWeatherData(
    FetchCurrentWeatherEvent event,
    Emitter<WeatherRemoteStates> emit,
  ) async {
    emit(WeatherRemoteLoading());
    final result = await fetchForecastWeatherUseCase.execute(
      lat: event.lat,
      lon: event.lon,
    );
    result.fold((failure) {
      emit(WeatherRemoteFailure(message: failure.message!));
    }, (data) {
      emit(WeatherRemoteFetchSuccess(weatherEntity: data));
    });
  }
}
