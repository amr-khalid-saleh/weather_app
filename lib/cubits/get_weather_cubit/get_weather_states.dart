import 'package:weather_app/models/weather_model.dart';

class GetWeatherState {}

class NoWeatherState extends GetWeatherState {}

class WeatherInfoLoadedState extends GetWeatherState {
  final WeatherModel weatherModel;

  WeatherInfoLoadedState({required this.weatherModel});
}

class WeatherFailureState extends GetWeatherState {
  final String errorMessage;

  WeatherFailureState({required this.errorMessage});
}
