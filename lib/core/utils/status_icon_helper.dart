import 'package:weather_tracker/core/constants/app_assets.dart';

abstract class StatusIconHelper {
  static final Map<int, String> _weatherIconsMap = {
    202: AppAssets.thunderstormWithRain,
    232: AppAssets.thunderstormWithDrizzle,
    233: AppAssets.thunderstormWithHail,
    300: AppAssets.lightRainCloud, // 300..501 = drizzle
    520: AppAssets.heavyRainCloud, // 502..520 = heavy rain
    521: AppAssets.lightRainSunCloud2, // shower rain
    600: AppAssets.snowflake, // 600..700 = snow
    700: AppAssets.cloudsWithWaves, // 701..800 = mist or foggy
    800: AppAssets.sunny,
    801: AppAssets.partlySunny,
    802: AppAssets.partlySunny,
    803: AppAssets.mostlySunny,
    804: AppAssets.cloudyMore,
    900: AppAssets.cloudyMore,
  };

  static getWeatherIcon({required int code}) {
    if (code >= 200 && code <= 202) {
      return _weatherIconsMap[202];
    } else if (code >= 230 && code <= 232) {
      return _weatherIconsMap[232];
    } else if (code == 233) {
      return _weatherIconsMap[code];
    } else if (code >= 300 && code <= 501) {
      return _weatherIconsMap[300];
    } else if (code >= 502 && code <= 520) {
      return _weatherIconsMap[520];
    } else if (code == 521) {
      return _weatherIconsMap[521];
    } else if (code >= 600 && code <= 623) {
      return _weatherIconsMap[600];
    } else if (code >= 700 && code <= 751) {
      return _weatherIconsMap[700];
    } else if (code == 800) {
      return _weatherIconsMap[800];
    } else {
      return _weatherIconsMap[code] ?? AppAssets.sunny;
    }
  }
}
