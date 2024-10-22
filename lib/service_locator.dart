import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_tracker/features/weather/data/datasource/local/weather_db_box.dart';
import 'package:weather_tracker/features/weather/data/datasource/remote/weather_api_service.dart';
import 'package:weather_tracker/features/weather/data/repository/weather_repository_impl.dart';
import 'package:weather_tracker/features/weather/domain/repository/weather_repository.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_city_weather_use_case.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_current_weather_use_case.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_forecast_weather_use_case.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_locally_weather_use_case.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/save_weather_locally_use_case.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_bloc.dart';

import 'features/weather/presentation/bloc/local/weather_local_bloc.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  final objectBoxDb = await WeatherDbBox.create();
  //** Dio */
  getIt.registerLazySingleton<Dio>(() => Dio());

  //** Api services */
  getIt.registerLazySingleton<WeatherApiServices>(
      () => WeatherApiServices(dioClient: getIt()));

  getIt.registerLazySingleton<WeatherDbBox>(() => objectBoxDb);

  //** Repositories */
  getIt.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      apiServices: getIt(),
      weatherDbBox: getIt(),
    ),
  );

  //** UseCases */
  getIt.registerLazySingleton<FetchHourlyWeatherUseCase>(
    () => FetchHourlyWeatherUseCase(
      weatherRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<FetchForecastWeatherUseCase>(
    () => FetchForecastWeatherUseCase(
      weatherRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<FetchWeatherByCityNameUseCase>(
    () => FetchWeatherByCityNameUseCase(
      weatherRepository: getIt(),
    ),
  );

  // local use case
  getIt.registerLazySingleton<SaveWeatherLocallyUseCase>(
    () => SaveWeatherLocallyUseCase(
      weatherRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<FetchLocallyWeatherUseCase>(
    () => FetchLocallyWeatherUseCase(
      weatherRepository: getIt(),
    ),
  );

  //** Blocs */
  getIt.registerFactory<WeatherRemoteBloc>(
    () => WeatherRemoteBloc(
      fetchHourlyWeather: getIt(),
      fetchForecastWeather: getIt(),
      fetchWeatherByCityName: getIt(),
    ),
  );

  getIt.registerFactory<WeatherLocalBloc>(
    () => WeatherLocalBloc(
      saveWeatherLocallyUseCase: getIt(),
      fetchLocallyWeatherUseCase: getIt(),
    ),
  );
}
