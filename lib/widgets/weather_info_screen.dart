import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../get_weather_data_cubit/weather_data_cubit.dart';
import '../main.dart';

class WeatherInfoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getWeatherColor(BlocProvider.of<WeatherDataCubit>(context).weatherDataModel!.text),
            getWeatherColor(BlocProvider.of<WeatherDataCubit>(context).weatherDataModel!.text)[300]!,
            getWeatherColor(BlocProvider.of<WeatherDataCubit>(context).weatherDataModel!.text)[200]!,
            getWeatherColor(BlocProvider.of<WeatherDataCubit>(context).weatherDataModel!.text)[50]!,

          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 60,
        children: [
          Column(
            children: [
              Text(
                "${BlocProvider.of<WeatherDataCubit>(context).weatherDataModel!.name}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Text(
                "Updated at ${BlocProvider.of<WeatherDataCubit>(context).weatherDataModel!.last_updated.hour}:${BlocProvider.of<WeatherDataCubit>(context).weatherDataModel!.last_updated.minute}",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 70,
            children: [
              Image(
                image: NetworkImage("https:${BlocProvider.of<WeatherDataCubit>(context).weatherDataModel!.icon}"),
                height: 100,
                width: 100,
              ),
              Text(
                "${BlocProvider.of<WeatherDataCubit>(context).weatherDataModel!.avgtemp_c}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Column(
                children: [
                  Text(
                    style: TextStyle(
                      fontSize: 16
                    ),
                    "MaxTemp : ${BlocProvider.of<WeatherDataCubit>(context).weatherDataModel!.maxtemp_c.round()}",
                  ),
                  Text(
                    style: TextStyle(
                        fontSize: 16
                    ),
                    "MinTemp : ${BlocProvider.of<WeatherDataCubit>(context).weatherDataModel!.mintemp_c.round()}",
                  ),
                ],
              ),
            ],
          ),
          Text(
            "${BlocProvider.of<WeatherDataCubit>(context).weatherDataModel!.text}",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
