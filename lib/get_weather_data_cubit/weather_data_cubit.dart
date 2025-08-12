import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/weather_data_model.dart';
import '../services/network/remote/dio_helper.dart';
import 'weather_data_states.dart';

class WeatherDataCubit extends Cubit<WeatherStates>
{
  WeatherDataCubit() : super(InitialState());

  WeatherDataModel? weatherDataModel;
  void getWeatherData(String cityName) async
  {
    try {
      emit(GetWeatherDataLoadingState());
      weatherDataModel = await DioHelper(Dio()).getWeatherData(cityName);
      emit(GetWeatherDataSuccessState());
    } catch (e) {
      print(e.toString());
      emit(GetWeatherDataErrorState());
    }
  }

}