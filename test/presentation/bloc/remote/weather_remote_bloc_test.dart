import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import '../../../helpers/dummy/dummy_data.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../helpers/test_helper.mocks.dart';
import 'package:weather_tracker/core/error/api_failure.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_bloc.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_events.dart';
import 'package:weather_tracker/features/weather/presentation/bloc/remote/weather_remote_states.dart';

void main() {
  late MockFetchForecastWeatherUseCase mockFetchForecastWeatherUseCase;
  late WeatherRemoteBloc weatherRemoteBloc;

  setUp(() {
    mockFetchForecastWeatherUseCase = MockFetchForecastWeatherUseCase();
    weatherRemoteBloc = WeatherRemoteBloc(
      fetchForecastWeatherUseCase: mockFetchForecastWeatherUseCase,
    );
  });

  group(
    "Test for WeatherRemoteBloc",
    () {
      test(
        "Test for Initial State",
        () {
          expect(weatherRemoteBloc.state, WeatherRemoteInitial());
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
        act: (bloc) => bloc.add(const FetchCurrentWeatherEvent(
          lat: lat,
          lon: lon,
        )),
        wait: const Duration(milliseconds: 300),
        expect: () => [
          WeatherRemoteLoading(),
          WeatherRemoteFetchSuccess(weatherEntity: testWeather),
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
        act: (bloc) => bloc.add(const FetchCurrentWeatherEvent(
          lat: lat,
          lon: lon,
        )),
        wait: const Duration(milliseconds: 300),
        expect: () => [
          WeatherRemoteLoading(),
          const WeatherRemoteFailure(message: "Server Failure"),
        ],
      );
    },
  );
}
