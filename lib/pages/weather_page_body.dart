import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/constant/get_days.dart';
import 'package:weather_app/constant/weather_card.dart';
import 'package:weather_app/constant/weather_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/thems/app_colors.dart';

class WeatherPageBody extends StatelessWidget {
  const WeatherPageBody({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    //Get the image and the weather status>>
    WeatherHelper weatherHelper = WeatherHelper();
    //End 

    //The bottun message >>>>
    int hourTime = DateTime.now().hour;
    Widget getMessage() {
      if (hourTime >= 6 && hourTime <= 12) {
        return Text('Good Morning',);
      } else if (hourTime >= 12 && hourTime <= 20) {
        return Text(
          'Good Afternoon ',
          style: GoogleFonts.boldonse(fontSize: 20),
        );
      } else {
        return Text('Good night', style: GoogleFonts.boldonse(fontSize: 20));
      }
    }
    //End

    //Get the day
    GetDays getToday = GetDays();
    int nn = DateTime.wednesday;
    //End
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: ((context, state) {
          //Loading >>>
          if (state is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          }
          //End of Loading
          //The weather is loaded >>>
           else if (state is WeatherLoaded) {
            List weatherList = weatherHelper.getImage(
              state.weatherModel.current!.weatherCode!,
            );
            return ListView(
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
                              getToday.getDays(nn),
                              style: GoogleFonts.boldonse(
                                fontSize: 20,
                                color: AppColors.primaryGray,
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
                    Text(
                      "${state.weatherModel.current!.temperature2m!.toInt()} ${state.weatherModel.currentUnits!.temperature2m}",
                      style: GoogleFonts.boldonse(fontSize: 50),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "weatherdays");
                      },
                      child: Text(
                        "See other days",
                        style: GoogleFonts.boldonse(
                          fontSize: 20,
                          color: AppColors.primaryOrange,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      weatherList[0],
                      style: GoogleFonts.boldonse(fontSize: 25),
                    ),
                    const SizedBox(height: 20),
                    WeatherCard(
                      dontShowImage: false,
                      sunRise1: "SunRise",
                      sunRise2: state.weatherModel.daily!.sunrise![0].split(
                        'T',
                      )[1],
                      sunSet1: "Sunset",
                      sunSet2: state.weatherModel.daily!.sunset![0].split(
                        "T",
                      )[1],
                    ),
                    Divider(color: Colors.grey[800]),
                    WeatherCard(
                      dontShowImage: true,
                      sunRise1: "wind speed",
                      sunRise2:
                          "${state.weatherModel.current!.windSpeed10m} ${state.weatherModel.currentUnits!.windSpeed10m}",
                      sunSet1: "Humidity",
                      sunSet2:
                          "${state.weatherModel.hourly!.relativeHumidity2m![0]} ${state.weatherModel.hourlyUnits!.relativeHumidity2m}",
                    ),
                  ],
                ),
              ],
            );
          } else if (state is WeatherError) {
            return Text("Error message ${state.errorMessage}");
          } else {
            return Center(child: CircularProgressIndicator(color: Colors.blue));
          }
        }),
      ),
    );
  }
}
