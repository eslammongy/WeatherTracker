import 'package:flutter_test/flutter_test.dart';
import '../../../helpers/test_helper.mocks.dart';
import 'package:weather_tracker/features/weather/data/repository/weather_repository_impl.dart';

void main() {
  late final MockHttpClient mockHttpClient;
  late WeatherRepositoryImpl weatherRepositoryImpl;

  setUp(
    () {
      mockHttpClient = MockHttpClient();
      weatherRepositoryImpl = WeatherRepositoryImpl(client: mockHttpClient);
    },
  );

  group(
    "fetch current city weather data",
    () {},
  );
}
