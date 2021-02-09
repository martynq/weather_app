import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/apiWeather.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/search_for_weather_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black12,
        body: BlocProvider(
            create: (context) => WeatherBloc(ApiWeather()),
            child: SearchForWeatherPage(),
      ),
    )
    );
  }
}
