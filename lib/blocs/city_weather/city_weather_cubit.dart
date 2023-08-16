import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/search_view.dart';

import '../../services/dio/dio.dart';
import '../../services/shared_reference/shared_preference.dart';

part 'city_weather_state.dart';

class CityWeatherCubit extends Cubit<CityWeatherState> {
  CityWeatherCubit() : super(CityWeatherInitial());

  static CityWeatherCubit get(context) => BlocProvider.of(context);
  WeatherModel? cityWeather;
  String? image;
  String? cityName;
  int cnt=0;
  navigation(var context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchView()),
    );
    emit(NavigationState());
  }

  assignWeather(WeatherModel weather, String cityName) {
    cityWeather = weather;
    image = weather.getImage();
    cityName = cityName;
    cnt=0;
    emit(AssignWeatherState());
  }
  search(data,context)async{
    cityName = data;
    await DioHelper.getData(cityName: cityName!).then((value) {
      WeatherModel weather = WeatherModel();
      weather = WeatherModel.fromJson(value.data);
      SharedPreference.saveData(key: "lastSearch", value: cityName);
      assignWeather(weather, cityName!);
    }).catchError((error) {});
    Navigator.pop(context);
    emit(SearchState());

  }
  initScreen()async{
    String lastSearch=SharedPreference.getData(key: "lastSearch");
    if(SharedPreference.getData(key: "lastSearch")!=null && cnt==0) {
      await DioHelper.getData(cityName: lastSearch).then((value) {
        WeatherModel weather = WeatherModel();
        weather = WeatherModel.fromJson(value.data);
        print(lastSearch);
        SharedPreference.saveData(key: "lastSearch", value: lastSearch);
        print(SharedPreference.getData(key: "lastSearch"));
        assignWeather(weather, lastSearch);
      }).catchError((error) {});
    }
    cnt++;
    emit(initScreenState());

  }
}
