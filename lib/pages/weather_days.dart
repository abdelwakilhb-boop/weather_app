import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/constant/bg_weather.dart';
import 'package:weather_app/constant/days_weathr_card.dart';
import 'package:weather_app/constant/weather_helper.dart';
import 'package:weather_app/models/weather_servics.dart';
import 'package:weather_app/position/get_user_position.dart';

class WeatherDays extends StatefulWidget {
  const new({super.key});

  @override
  State<WeatherDays> createState() => _WeatherDaysState();
}

class _WeatherDaysState extends State<WeatherDays> {
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

  WeatherHelper weatherHelper = WeatherHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WeatherBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13, vertical: 13),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context, "weatherpage");
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                      const SizedBox(width: 14),
                      Text("Back", style: GoogleFonts.boldonse(fontSize: 19)),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Icon(Icons.calendar_month, size: 40.0),
                      const SizedBox(width: 20),
                      Text(
                        "This week",
                        style: GoogleFonts.boldonse(fontSize: 25),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is WeatherLoaded) {
                    List nn = weatherHelper.getImage(
                      state.weatherModel.current!.weatherCode!,
                    );

                    return DaysWeathrCard(
                      temperature2m:
                          "${state.weatherModel.current!.temperature2m!.toInt()} ${state.weatherModel.currentUnits!.temperature2m}",
                      image: nn[1],
                      weatherState: nn[0],
                      day: "Monday",
                    );
                  } else if (state is WeatherError) {
                    return Text("Error ${state.errorMessage}");
                  } else {
                    return CircularProgressIndicator(color: Colors.amberAccent);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
