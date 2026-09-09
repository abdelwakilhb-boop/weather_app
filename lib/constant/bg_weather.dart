import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/thems/app_colors.dart';

class WeatherBackground extends StatelessWidget {
  final Widget child;

  const WeatherBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF18142A),
            Color(0xFF090910),
            Color(0xFF050508),
          ],
        ),
      ),
      child: Stack(
        children: [
          // الضوء البنفسجي في الخلفية
          Positioned(
            top: -100,
            right: -80,
            child: _glow(
              color: AppColors.primaryBlue,
              size: 580,
            ),
          ),

          // الضوء البرتقالي
          Positioned(
            top: 80,
            left: 0,
            child: _glow(
              color: AppColors.primaryOrange,
              size: 500,
            ),
          ),

          // Blur
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 60,
                sigmaY: 60,
              ),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),

          // محتوى التطبيق
          SafeArea(
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _glow({
    required Color color,
    required double size,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color.withValues(alpha: 0.5),
            color.withValues(alpha: 0.0),
          ],
        ),
      ),
    );
  }
}