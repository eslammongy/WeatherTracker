import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_tracker/core/error/api_failure.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_bloc.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_events.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_states.dart';

import '../../../helpers/dummy/dummy_data.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockFetchForecastWeatherUseCase mockFetchForecastWeatherUseCase;
  late MockFetchHourlyWeatherUseCase fetchHourlyWeatherUseCase;
  late MockFetchWeatherByCityNameUseCase fetchWeatherByCityNameUseCase;
  late WeatherRemoteBloc weatherRemoteBloc;

  setUp(() {
    mockFetchForecastWeatherUseCase = MockFetchForecastWeatherUseCase();
    fetchHourlyWeatherUseCase = MockFetchHourlyWeatherUseCase();
    fetchWeatherByCityNameUseCase = MockFetchWeatherByCityNameUseCase();
    weatherRemoteBloc = WeatherRemoteBloc(
      fetchForecastWeather: mockFetchForecastWeatherUseCase,
      fetchHourlyWeather: fetchHourlyWeatherUseCase,
      fetchWeatherByCityName: fetchWeatherByCityNameUseCase,
    );
  });

  group(
    "Test for WeatherRemoteBloc",
    () {
      test(
        "Test for Initial State",
        () {
          expect(weatherRemoteBloc.state, WeatherRemoteInitialState());
        },
      );

      const lat = 9090.0;
      const lon = 3333.0;

      blocTest<WeatherRemoteBloc, WeatherRemoteStates>(
        'emits [Loading, FetchSuccess] when fetching current weather data is added.',
        build: () {
          when(mockFetchForecastWeatherUseCase.execute(lat: lat, lon: lon))
              .thenAnswer((_) async {
            return Right(testWeather);
          });
          return weatherRemoteBloc;
        },
        act: (bloc) => bloc.add(const FetchHourlyWeatherEvent(
          lat: lat,
          lon: lon,
        )),
        wait: const Duration(milliseconds: 300),
        expect: () => [
          WeatherRemoteLoadingState(),
          WeatherRemoteFetchSuccessState(weatherEntity: testWeather),
        ],
      );
      blocTest<WeatherRemoteBloc, WeatherRemoteStates>(
        'emits [Loading, Failure] when fetching current weather data is added.',
        build: () {
          when(mockFetchForecastWeatherUseCase.execute(lat: lat, lon: lon))
              .thenAnswer((_) async {
            return Left(ServerFailure(message: "Server Failure"));
          });
          return weatherRemoteBloc;
        },
        act: (bloc) => bloc.add(const FetchHourlyWeatherEvent(
          lat: lat,
          lon: lon,
        )),
        wait: const Duration(milliseconds: 300),
        expect: () => [
          WeatherRemoteLoadingState(),
          isA<WeatherRemoteFailureState>(),
        ],
      );
    },
  );
}
