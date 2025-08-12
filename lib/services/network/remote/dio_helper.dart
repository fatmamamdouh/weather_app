import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_data_model.dart';

class DioHelper
{
  final Dio dio;
  DioHelper(this.dio);

  String baseUrl = "https://api.weatherapi.com/v1";
  String apiKey = "ae43a001ce6c409f90293611232102";

  Future<WeatherDataModel> getWeatherData(String cityName) async
  {

    Response response =
        await dio.get("$baseUrl/forecast.json?key=$apiKey&q=$cityName");

    WeatherDataModel weatherDataModel = WeatherDataModel.fromJson(response.data);
    return weatherDataModel;

  }
}