import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/widgets/no_weather_widget.dart';
import 'package:weather_app/widgets/weather_widget.dart';
import '../cubits/get_weather_cubit/get_weather_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          if (state is WeatherInfoLoadedState) {
            return WeatherWidget();
          } else if (state is NoWeatherState) {
            return  NoWeatherWidget();
          } else {
            return const Text("oops... there was an error");
          }
        },
      ),
    );
  }
}
