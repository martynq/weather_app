import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/apiWeather.dart';
import 'package:weather_app/model/weatherModel.dart';
import 'package:equatable/equatable.dart';

class WeatherEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent{
  final String cityName;

  FetchWeather(this.cityName);

  @override
  List<Object> get props => [cityName];

}

class ResetWeather extends WeatherEvent {

}


class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}


class NoSearch extends WeatherState{
}

class WeatherLoading extends WeatherState {
}

class WeatherLoaded extends WeatherState{
  final _weather;

  WeatherLoaded(this._weather);

  WeatherModel get getWeather => _weather;


  @override
  List<Object> get props => [_weather];

}

class WeatherError extends WeatherState{

}




class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  WeatherBloc(this.apiWeather) : super(NoSearch());

 final ApiWeather apiWeather;

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    // TODO: implement mapEventToState
    if (event is FetchWeather){
      yield WeatherLoading();

      try {
        WeatherModel weather = await apiWeather.getWeatherData(event.cityName);
        yield WeatherLoaded(weather);
      }catch(_){
        print(_);
        yield WeatherError();
      }

    } else if (event is ResetWeather){
      yield NoSearch();
    }
  }

}