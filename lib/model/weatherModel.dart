class WeatherModel {
  int sunrise;
  int sunset;
  int humidity;

  String iconCode;
  String main;
  String cityName;

  double windSpeed;

  double temperature;
  int pressure;


  WeatherModel({
    this.sunrise,
    this.sunset,
    this.humidity,
    this.iconCode,
    this.main,
    this.cityName,
    this.windSpeed,
    this.temperature,
    this.pressure,
   });

  static WeatherModel fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    return WeatherModel(
      iconCode: weather['icon'],
      main: weather['main'],
      cityName: json['name'],
      temperature: json['main']['temp'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      windSpeed: json['wind']['speed'],
    );
  }
}