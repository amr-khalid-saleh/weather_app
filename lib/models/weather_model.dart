class WeatherModel {
  final String city_name;
  final DateTime date;
  final String image;
  final double avg_temp;
  final double min_temp;
  final double max_temp;
  final String weather_condition;

  WeatherModel({
    required this.city_name,
    required this.date,
    required this.image,
    required this.avg_temp,
    required this.min_temp,
    required this.max_temp,
    required this.weather_condition,
  });

  factory WeatherModel.fromjson(Map<String, dynamic> json) {
    return WeatherModel(
      city_name: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      avg_temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      min_temp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      max_temp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      weather_condition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
