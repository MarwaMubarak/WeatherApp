import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/city_weather_model.dart';
import 'package:weather_app/views/search_view.dart';
part 'city_weather_state.dart';

class CityWeatherCubit extends Cubit<CityWeatherState> {
  CityWeatherCubit() : super(CityWeatherInitial());
  static CityWeatherCubit get(context)=>BlocProvider.of(context);
CityWeatherModel? cityWeather;
String?Image;
String?CityName;
  Navigation(var context)
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchView()),
    );
    emit(NavigationState());
  }
  AssignWeather(CityWeatherModel weather,String cityName)
  {
    cityWeather=weather;
    Image=weather.getImage();
    CityName=cityName;
    emit(AssignWeatherState());
  }

}