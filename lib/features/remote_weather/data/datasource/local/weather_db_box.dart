import 'package:weather_tracker/objectbox.g.dart';
import 'package:weather_tracker/features/remote_weather/domain/entities/weather_entity.dart';

class WeatherDbBox {
  late final Store store;
  late final Box<WeatherEntity> weatherBox;
  WeatherDbBox._create(this.store) {
    weatherBox = Box<WeatherEntity>(store);
  }

  static Future<WeatherDbBox> create() async {
    final store = await openStore();
    return WeatherDbBox._create(store);
  }
}
