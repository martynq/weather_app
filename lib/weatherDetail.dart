import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/model/weatherModel.dart';

class WeatherDetail extends StatelessWidget {
  final WeatherModel weatherModel;
  final cityName;

  WeatherDetail(this.weatherModel, this.cityName);

  @override
  Widget build(BuildContext context) {
    String icon = weatherModel.iconCode.toString();
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(),
          Text(
            weatherModel.cityName,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Text(
            (weatherModel.temperature - 273.15).round().toString() + " °C",
            style: TextStyle(
              color: Colors.white38,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Temperature',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.white38)),
            child: Text(
              weatherModel.main,
              style: TextStyle(
                color: Colors.white38,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: SizedBox.shrink(),
              ),
              Column(
                children: [
                  Text(
                    weatherModel.windSpeed.round().toString() + " km/h",
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Wind',
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: SizedBox.shrink(),
              ),
              Column(
                children: [
                  Text(
                    weatherModel.pressure.toString() + ' hPa',
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Pressure',
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: SizedBox.shrink(),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.all(30.0),
            padding: const EdgeInsets.only(
                left: 25.0, right: 25.0, top: 3.0, bottom: 3.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.teal), color: Colors.teal),
            child: FlatButton(
              onPressed: () {
                BlocProvider.of<WeatherBloc>(context).add(ResetWeather());
              },
              child: Text(
                'Back',
                style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
