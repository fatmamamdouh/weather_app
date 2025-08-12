import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/get_weather_data_cubit/weather_data_cubit.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_data_screen.dart';
import 'package:weather_app/widgets/weather_info_screen.dart';

import '../get_weather_data_cubit/weather_data_states.dart';
import '../main.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchView(),
                  ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<WeatherDataCubit, WeatherStates>(
          builder: (BuildContext context, state)
          {
            if(state is GetWeatherDataSuccessState)
            {
              return WeatherInfoScreen();
            } else if(state is InitialState)
            {
              return NoWeatherDataScreen();
            } else if(state is GetWeatherDataLoadingState)
            {
              return Center(
                  child: CircularProgressIndicator(
                    color: getWeatherColor(BlocProvider.of<WeatherDataCubit>(context).weatherDataModel?.text),
                  )
              );
            } else
            {
              return Text("oops there was an error");
            }
          },
      ),
    );
  }
}
