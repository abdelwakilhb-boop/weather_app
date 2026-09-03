import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/models/weather_servics.dart';
part 'weather_event.dart';
part 'weather_state.dart';
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherServics weatherServics;
  WeatherBloc({required this.weatherServics}) : super(WeatherInitial()) {
    on<WeatherGeter>((_getWeather));
  }
  Future<void> _getWeather(WeatherGeter event, Emitter emit) async {
    print("Srarting app...........");
    emit(WeatherLoading());
    try {
      print('2-Caling API.................');
      WeatherModel weatherModel = await weatherServics.getWeatherServics(
        latitude: event.latitude,
        longitude: event.longitude,
      );
      print('3-Caling API suc.................');
      emit(WeatherLoaded(weatherModel));
      print('4-Caling API suc.................');
    } catch (e) {
      WeatherError(e.toString());
      print('5-Error: $e.................');
    }
  }
}
