import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'screens/home_screen.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(
          builder: (context) =>
              BlocBuilder<GetWeatherCubit, GetWeatherState>(
                builder: (context, state) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      useMaterial3: false,
                      primarySwatch: getConditionColor(
                        BlocProvider
                            .of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.weather_condition,
                      ),
                    ),
                    home: const HomeScreen(),
                  );
                },
              ),
        ),
      ),
    );
  }
}

MaterialColor getConditionColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.orange;

    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
      return Colors.blueGrey;

    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.grey;

    case 'patchy rain possible':
    case 'patchy freezing drizzle possible':
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'patchy light rain':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
      return Colors.indigo;

    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'thundery outbreaks possible':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.deepPurple;

    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'blowing snow':
    case 'blizzard':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'patchy light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
    case 'ice pellets':
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.lightBlue;

    default:
      return Colors.blueGrey;
  }
}
