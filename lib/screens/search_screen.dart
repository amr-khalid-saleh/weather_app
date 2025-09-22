import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search on your city"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 20.0,
        ),
        child: Center(
          child: TextField(
            enabled: true,
            onSubmitted: (value) async {
              BlocProvider.of<GetWeatherCubit>(context)
                  .getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 16.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.green,
                ),
              ),
              hintText: "Entre your city name ...",
              hintStyle: const TextStyle(),
              suffixIcon: const Icon(Icons.search_rounded),
              suffixIconColor: Colors.blueAccent,
              labelText: "search",
            ),
          ),
        ),
      ),
    );
  }
}
