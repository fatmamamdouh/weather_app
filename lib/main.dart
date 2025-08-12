import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/get_weather_data_cubit/weather_data_cubit.dart';
import 'package:weather_app/get_weather_data_cubit/weather_data_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherDataCubit(),
      child: BlocBuilder<WeatherDataCubit, WeatherStates>(
        builder : (context, state) => MaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
                  color: Colors.black,
              ),
                backgroundColor: getWeatherColor(BlocProvider.of<WeatherDataCubit>(context).weatherDataModel?.text),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: HomeView(),
        ),
      ),
    );
  }
}


MaterialColor getWeatherColor(String? dayCondition) {
  if(dayCondition == null)
  {
    return Colors.blue;
  } else
  {
    switch (dayCondition.toLowerCase()) {
      case "sunny":
        return Colors.orange;
      case "partly cloudy":
      case "cloudy":
      case "overcast":
        return Colors.blueGrey;
      case "mist":
      case "fog":
      case "freezing fog":
        return Colors.grey;
      case "patchy rain possible":
      case "light rain":
      case "moderate rain":
      case "heavy rain":
      case "light rain shower":
      case "moderate or heavy rain shower":
      case "torrential rain shower":
      case "patchy light rain":
      case "moderate rain at times":
      case "heavy rain at times":
        return Colors.blue;
      case "patchy snow possible":
      case "light snow":
      case "moderate snow":
      case "heavy snow":
      case "patchy moderate snow":
      case "patchy heavy snow":
      case "light snow showers":
      case "moderate or heavy snow showers":
      case "moderate or heavy snow with thunder":
        return Colors.lightBlue;
      case "thundery outbreaks possible":
      case "patchy light rain with thunder":
      case "moderate or heavy rain with thunder":
        return Colors.deepPurple;
      default:
        return Colors.blue;
    }
  }
}