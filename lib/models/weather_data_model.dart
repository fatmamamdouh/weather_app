class WeatherDataModel {
  final String name;
  final String text;
  final String icon;
  final DateTime last_updated;
  final double maxtemp_c;
  final double mintemp_c;
  final double avgtemp_c;


  WeatherDataModel({
    required this.name,
    required this.text,
    required this.icon,
    required this.last_updated,
    required this.maxtemp_c,
    required this.mintemp_c,
    required this.avgtemp_c,
  });

  factory WeatherDataModel.fromJson(Map<String, dynamic> json)
  {
    return WeatherDataModel(
        name: json['location']['name'],
        text: json['forecast']['forecastday'][0]['day']['condition']['text'],
        icon: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        last_updated: DateTime.parse(json['current']['last_updated']),
        maxtemp_c: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        mintemp_c: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        avgtemp_c: json['forecast']['forecastday'][0]['day']['avgtemp_c']
    );
  }

}
