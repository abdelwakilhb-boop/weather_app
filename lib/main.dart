import 'package:flutter/material.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/models/weather_servics.dart';
import 'package:weather_app/pages/weather_days.dart';
import 'package:weather_app/pages/weather_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherBloc(weatherServics: WeatherServics()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WeatherServics weatherServics = WeatherServics();
    return MaterialApp(
      routes: {
        "weatherpage": (context) => WeatherPage(),
        "weatherdays": (context) => WeatherDays(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        useMaterial3: true,

        textTheme: GoogleFonts.boldonseTextTheme(
          const TextTheme(
            bodyLarge: TextStyle(color: Color(0xFF2C3E50), fontSize: 18.0),
            bodyMedium: TextStyle(color: Color(0xFF7F8C8D)),
            titleLarge: TextStyle(
              color: Color(0xFF2C3E50),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: WeatherPage(),
    );
  }
}
