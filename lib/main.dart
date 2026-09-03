import 'package:flutter/material.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/models/weather_servics.dart';
import 'package:weather_app/pages/weather_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WeatherServics weatherServics = WeatherServics();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherServics: weatherServics),
        child: WeatherPage(),
      ),
    );
  }
}
