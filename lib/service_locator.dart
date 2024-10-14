import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_tracker/features/weather/data/datasource/local/weather_db_box.dart';
import 'package:weather_tracker/features/weather/data/datasource/remote/weather_api_service.dart';
import 'package:weather_tracker/features/weather/data/repository/weather_repository_impl.dart';
import 'package:weather_tracker/features/weather/domain/repository/weather_repository.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_city_weather_use_case.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_current_weather_use_case.dart';
import 'package:weather_tracker/features/weather/domain/usecaces/fetch_forecast_weather_use_case.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_bloc.dart';

import 'core/utils/internet_checker_service.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  InternetConnectivityChecker.init();
  final objectBoxDb = await WeatherDbBox.create();
  //** Dio */
  getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json)));

  //** Api services */
  getIt.registerLazySingleton<WeatherApiServices>(
      () => WeatherApiServices(client: getIt()));

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

  //** Blocs */
  getIt.registerFactory<WeatherRemoteBloc>(
    () => WeatherRemoteBloc(
      fetchHourlyWeather: getIt(),
      fetchForecastWeather: getIt(),
      fetchWeatherByCityName: getIt(),
    ),
  );
}
