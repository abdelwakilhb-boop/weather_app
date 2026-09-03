part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {
  
}
class WeatherGeter extends WeatherEvent{
  final double latitude;
  final double longitude;
  WeatherGeter({required this.latitude,required this.longitude});
}

