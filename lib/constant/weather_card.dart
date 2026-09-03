// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.dontShowImage,
    required this.sunRise1,
    required this.sunRise2,
    required this.sunSet1,
    required this.sunSet2,
  });
  final bool dontShowImage;
  final String sunRise1;
  final String sunRise2;
  final String sunSet1;
  final String sunSet2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            dontShowImage
                ? Text("")
                : Image.asset('assets/11.png', height: 70, width: 70),
            Column(
              mainAxisAlignment:MainAxisAlignment.start ,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sunRise1, style: GoogleFonts.boldonse()),
                const SizedBox(height: 10,),
                Text(sunRise2, style: GoogleFonts.boldonse()),
              ],
            ),
          ],
        ),
        Row(
          children: [
            dontShowImage
                ? Text("")
                : Image.asset('assets/12.png', height: 70, width: 70),
            Column(
              mainAxisAlignment:MainAxisAlignment.start ,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sunSet1, style: GoogleFonts.boldonse()),
                const SizedBox(height: 10,),
                Text(sunSet2, style: GoogleFonts.boldonse()),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
