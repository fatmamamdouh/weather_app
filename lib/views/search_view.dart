import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/get_weather_data_cubit/weather_data_cubit.dart';
import 'package:weather_app/models/weather_data_model.dart';
import 'package:weather_app/services/network/remote/dio_helper.dart';

import '../main.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20
          ),
          child: TextFormField(
            onFieldSubmitted: (value) async
            {
              BlocProvider.of<WeatherDataCubit>(context).getWeatherData(value);
              Navigator.of(context).pop();
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 32
              ),
              suffixIcon: Icon(Icons.search),
              label: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Search", style:
                TextStyle(
                  color: getWeatherColor(BlocProvider.of<WeatherDataCubit>(context).weatherDataModel?.text),
                ),
                ),
              ),
              hint: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Enter City Name",
                  style: TextStyle(
                  fontSize: 18
                ),),
              ),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: getWeatherColor(BlocProvider.of<WeatherDataCubit>(context).weatherDataModel?.text),
                )
              )
            ),
          ),
        ),
      ),
    );
  }
}
