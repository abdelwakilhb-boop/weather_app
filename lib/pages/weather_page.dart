import 'package:flutter/material.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/constant/bg_weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_servics.dart';
import 'package:weather_app/pages/weather_page_body.dart';
import 'package:weather_app/position/get_user_position.dart';

class WeatherPage extends StatefulWidget {
  const new({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherServics weatherServics = WeatherServics();
  GetUserPosition _getUserPosition = GetUserPosition();

  void getWeather() async {
    List<double> position = await _getUserPosition.determinePositionLatitude();
    context.read<WeatherBloc>().add(
      WeatherGeter(latitude: position[0], longitude: position[1]),
    );
  }

  @override
  void initState() {
    getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WeatherBackground(
        child: WeatherPageBody(
          onPressed: () {
            getWeather();
          },
        ),
      ),
    );
  }
}
