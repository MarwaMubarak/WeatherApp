import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/city_weather_cubit.dart';
import 'package:weather_app/models/city_weather_model.dart';

import '../views/home_view.dart';
class RootApp extends StatelessWidget {

  CityWeatherModel? cityWeatherModel;

  RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CityWeatherCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
