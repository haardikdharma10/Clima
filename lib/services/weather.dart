import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const apiKey = 'a04f34622a3860b708b1ee6da83844fc';
const openWeatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future <dynamic> getCityWeather(String cityName)async{
    var URL = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(URL);

    var cityweatherdata = await networkHelper.getData();
    return cityweatherdata;

  }

  Future<dynamic> getLocationWeather() async{
    Location l = Location();
    await l.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?lat=${l.latitude}&lon=${l.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
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
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
