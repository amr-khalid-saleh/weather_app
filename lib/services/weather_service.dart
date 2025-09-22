import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'ba1c98adfeb3418ab6c201746252808';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    Response response = await dio
        .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
    try {
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    }  on DioException catch (e) {
      log(e.toString());
      const String errMessage = e.response?.data['error']['message'] ?? 'Oops there was an error, Try later!';
      throw Exception(errMessage);
    }catch(e){
      log(e.toString());
      throw Exception('try later!');
    }
  }
}
