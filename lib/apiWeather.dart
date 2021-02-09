import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/model/weatherModel.dart';

class ApiWeather {


  Future<WeatherModel> getWeatherData(String cityName) async {
    final url = 'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=326200afc1b528e578a542d7bc2233dc';
    print('fetching $url');
    final res = await http.Client().get(url);
    if (res.statusCode != 200) {
      throw Exception("unable to fetch weather data");
    }
    final weatherJson = json.decode(res.body);
    return WeatherModel.fromJson(weatherJson);
  }
}

//   Future<WeatherModel> getWeather(String cityName) async {
//     final result = await http.Client().get("http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=326200afc1b528e578a542d7bc2233dc");
//
//   if(result.statusCode != 200)
//     throw Exception();
//   //return parsedJson(result.body);
//
//   }
//
//   WeatherModel parsedJson(final response) {
//
//     final jsonDecoded = json.decode(response);
//     final jsonWeather = jsonDecoded["main"];
//
//     return WeatherModel.fromJson(jsonWeather);
//   }
// }