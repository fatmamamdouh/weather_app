import 'package:flutter/cupertino.dart';

class NoWeatherDataScreen extends StatelessWidget {
  const NoWeatherDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No weather data now 😔,",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),),
          Text(
            "please search country 🌏",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),),
        ],
      ),
    );
  }
}
