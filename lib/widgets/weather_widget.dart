import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/search_screen.dart';

import '../weather_app.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    weatherModel.image.contains('http');
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getConditionColor(weatherModel.weather_condition),
            getConditionColor(weatherModel.weather_condition)[400]!,
            getConditionColor(weatherModel.weather_condition)[300]!,
            getConditionColor(weatherModel.weather_condition)[200]!,
            getConditionColor(weatherModel.weather_condition)[50]!,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                Text(
                  weatherModel.city_name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.search_rounded),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
              child: Text(
                'Update at ${weatherModel.date.hour}:${weatherModel.date.minute}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Image.network(
              'https:${weatherModel.image}',
            ),
            Text(
              weatherModel.weather_condition,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              weatherModel.avg_temp.round().toString(),
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(width: 1, color: Colors.white),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.blueAccent,
                        size: 14,
                      ),
                      Text(
                        weatherModel.min_temp.round().toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.arrow_upward_rounded,
                        color: Colors.redAccent,
                        size: 14,
                      ),
                      Text(
                        weatherModel.max_temp.round().toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
