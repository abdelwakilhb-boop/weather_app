import 'package:flutter/material.dart';

class WeatherHelper {
 List getImage(int code) {
    if (code == 0) {
      return ['Clear sky', Image.asset('assets/6.png')];
    } else if (code >= 1 && code <= 3) {
      return ['Cloudy', Image.asset('assets/7.png')];
    } else if (code >= 45 && code <= 48) {
      return ['Fog', Image.asset('assets/8.png')];
    } else if (code >= 51 && code <= 67) {
      return ['Drizzle/Rain', Image.asset('assets/2.png')];
    } else if (code >= 71 && code <= 77) {
      return ['Snow', Image.asset('assets/4.png')];
    } else if (code >= 80 && code <= 82) {
      return ['Rain showers', Image.asset('assets/3.png')];
    } else if (code >= 95) {
      return ['Thunderstorm', Image.asset('assets/1.png')];
    } else {
      return ['Error $code',Text(code.toString())];
    }
  }
}
