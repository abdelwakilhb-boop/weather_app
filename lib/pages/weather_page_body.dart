import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/constant/weather_card.dart';
import 'package:weather_app/constant/weather_helper.dart';

class WeatherPageBody extends StatelessWidget {
  const WeatherPageBody({
    super.key,
    required this.temperature2m,
    required this.code,
    required this.sunRise,
    required this.sunSet,
    required this.windSpeed,
    required this.humidity,
    this.onPressed,
  });
  final String temperature2m;
  final int code;
  final String sunRise;
  final String sunSet;
  final String windSpeed;
  final String humidity;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    WeatherHelper weatherHelper = WeatherHelper();
    List weatherList = weatherHelper.getImage(code);
    int hourTime = DateTime.now().hour;
    Widget getMessage() {
      if (hourTime >= 6 && hourTime <= 12) {
        return Text('Good Morning', style: GoogleFonts.boldonse(fontSize: 20));
      } else if (hourTime >= 12 && hourTime <= 20) {
        return Text('Good Afternoon ', style: GoogleFonts.boldonse(fontSize: 20));
      } else {
        return Text('Good night', style: GoogleFonts.boldonse(fontSize: 20));
      }
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "City 📌",
                        style: GoogleFonts.boldonse(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                      getMessage(),
                    ],
                  ),
                  IconButton(
                    onPressed: onPressed,
                    icon: Icon(Icons.restart_alt, size: 50),
                  ),
                ],
              ),
              weatherList[1],
              // SizedBox(height: 10,),
              Text(temperature2m, style: GoogleFonts.boldonse(fontSize: 50)),
              const SizedBox(height: 10),
              Text(weatherList[0], style: GoogleFonts.boldonse(fontSize: 25)),
              const SizedBox(height: 20),
              WeatherCard(
                dontShowImage: false,
                sunRise1: "SunRise",
                sunRise2: sunRise,
                sunSet1: "Sunset",
                sunSet2: sunSet,
              ),
              Divider(color: Colors.grey[800]),
              WeatherCard(
                dontShowImage: true,
                sunRise1: "wind speed",
                sunRise2: windSpeed.toString(),
                sunSet1: "Humidity",
                sunSet2: humidity,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
