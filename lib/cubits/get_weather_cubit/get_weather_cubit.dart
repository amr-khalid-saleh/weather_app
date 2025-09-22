import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import '../../services/weather_service.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(NoWeatherState());

  WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherInfoLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(errorMessage: e.toString()));
    }
  }
}
