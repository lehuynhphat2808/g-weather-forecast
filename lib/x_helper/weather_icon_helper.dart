class WeatherIconHelper {
  static String getIconPath(int code) {
    switch (code) {
      // ☀️ Clear / Sunny
      case 1000:
        return 'assets/icons/sunny.png';

      // 🌤 Partly cloudy
      case 1003:
        return 'assets/icons/partly_cloudy.png';

      // ☁️ Cloudy / Overcast
      case 1006:
        return 'assets/icons/cloudy.png';
      case 1009:
        return 'assets/icons/overcast.png';

      // 🌫 Fog / Mist
      case 1030:
        return 'assets/icons/mist.png';
      case 1135:
      case 1147:
        return 'assets/icons/fog.png';

      // 🌧 Light Rain
      case 1063:
      case 1150:
      case 1153:
      case 1180:
        return 'assets/icons/light_rain.png';

      // 🌦 Moderate Rain
      case 1183:
      case 1186:
      case 1189:
        return 'assets/icons/moderate_rain.png';

      // 🌧️ Heavy Rain
      case 1192:
      case 1195:
        return 'assets/icons/heavy_rain.png';

      // ⛈ Thunderstorm
      case 1273:
      case 1276:
        return 'assets/icons/thunderstorm.png';

      // ❄️ Snow
      case 1066:
      case 1210:
      case 1213:
        return 'assets/icons/snow.png';

      // ❄️ Heavy Snow
      case 1216:
      case 1219:
      case 1222:
      case 1225:
        return 'assets/icons/heavy_snow.png';

      // 🌨 Sleet
      case 1204:
      case 1207:
        return 'assets/icons/sleet.png';

      // 🌦 Showers
      case 1240:
      case 1243:
        return 'assets/icons/showers.png';

      // 🚫 Default fallback
      default:
        return 'assets/icons/default.png';
    }
  }
}
