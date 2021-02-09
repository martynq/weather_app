import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/weatherDetail.dart';

class SearchForWeatherPage extends StatefulWidget {
  @override
  _SearchForWeatherPageState createState() => _SearchForWeatherPageState();
}

class _SearchForWeatherPageState extends State<SearchForWeatherPage> {
  @override
  Widget build(BuildContext context) {
    var cityController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is NoSearch)
              return Center(
                child: Container(
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://lensexperts.com/wp/wp-content/uploads/2019/04/BLOG-IMAGE-Weather-Changes-and-How-Your-Contacts-May-be-Affected-35198615_m.jpg'),
                  ),
                  height: 260,
                  width: 260,
                ),
              );
            else if (state is WeatherLoaded)
              return Center(
                child: Container(
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage("http://openweathermap.org/img/w/${state.getWeather.iconCode.toString()}.png"),),
                  height: 100,
                  width: 100,
                ),
              );
            else
              return SizedBox.shrink();
          },
        ),
        BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is NoSearch)
              return Container(
                padding: EdgeInsets.only(
                  top: 30,
                  left: 40,
                  right: 40,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Search Weather',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white70),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                        style: TextStyle(color: Colors.white70),
                        controller: cityController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white38,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Colors.white38,
                                style: BorderStyle.solid),
                          ),
                          hintText: "City Name",
                          hintStyle: TextStyle(color: Colors.white38),
                        )),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      color: Colors.teal,
                      width: double.infinity,
                      height: 50,
                      child: FlatButton(
                        onPressed: () {
                          BlocProvider.of<WeatherBloc>(context)
                              .add(FetchWeather(cityController.text));
                        },
                        child: Text(
                          'Search',
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        textColor: Colors.black,
                        minWidth: 20.0,
                        height: 20.0,
                        textTheme: ButtonTextTheme.normal,
                      ),
                    ),
                  ],
                ),
              );
            else if (state is WeatherLoading)
              return Center(
                child: CircularProgressIndicator(),
              );
            else if (state is WeatherLoaded)
              return WeatherDetail(state.getWeather, cityController.text);
            else
              return Text(
                'Error',
                style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              );
          },
        ),
      ],
    );
  }
}
