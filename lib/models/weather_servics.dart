import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServics {
  Future<WeatherModel> getWeatherServics({
    required double latitude,
    required double longitude,
  }) async {
    final Uri url = Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&timezone=auto&current=temperature_2m,wind_speed_10m,weather_code&daily=sunrise,sunset&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m',
    );
    var res = await get(url);
    if (res.statusCode == 200) {
      final weather = jsonDecode(res.body);
      return WeatherModel.fromJson(weather);
    } else {
      print(">>>>>>>>>>>${res.statusCode}");
      throw Exception('Failed to load weather');
    }
  }
}
