import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DaysWeathrCard extends StatelessWidget {
  const DaysWeathrCard({
    super.key,
    required this.temperature2m,
    required this.image,
    required this.weatherState, required this.day,
  });
  final String temperature2m;
  final Image image;
  final String weatherState;
  final String day;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(day, style: GoogleFonts.boldonse(fontSize: 19)),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(weatherState, style: GoogleFonts.boldonse(fontSize: 19)),
              SizedBox(height: 40,width: 40,child: image,)
            ],
          ),
          const SizedBox(height: 10),
          Text(temperature2m, style: GoogleFonts.boldonse(fontSize: 19)),
        ],
      ),
    );
  }
}
