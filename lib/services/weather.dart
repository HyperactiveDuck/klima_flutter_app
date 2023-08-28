import 'package:klima_flutter_app/services/location.dart';
import 'package:klima_flutter_app/services/networking.dart';

var apiKey = "2365074cdb2b5aab4c78d415855e9d06";
const openWeatherMapWeather = '';
const openWeatherMapLocation = '';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper();
    var weatherDataByCity = await networkHelper.getWeatherByCityName(url);
    return weatherDataByCity;
  }

  Future<dynamic> getWeatherData() async {
    LocationFetcher locationFetcher = LocationFetcher();
    await locationFetcher.getLocation();
    NetworkHelper networkHelper = NetworkHelper();

    var weatherData = await networkHelper.getData(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${locationFetcher.latitude}&lon=${locationFetcher.longitude}&appid=$apiKey&units=metric');

    return weatherData;
  }

  Future<dynamic> getLocationData() async {
    LocationFetcher locationFetcher = LocationFetcher();
    await locationFetcher.getLocation();
    NetworkHelper networkHelper = NetworkHelper();

    var cityData = await networkHelper.getCityName(
        'http://api.openweathermap.org/geo/1.0/reverse?lat=${locationFetcher.latitude}&lon=${locationFetcher.longitude}&appid=$apiKey');

    return cityData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ice cream time';
    } else if (temp > 20) {
      return 'Time for shorts and a t-shirt';
    } else if (temp < 10) {
      return 'You\'ll need a scarf and a pair of gloves';
    } else {
      return 'Bring a coat just in case';
    }
  }
}
