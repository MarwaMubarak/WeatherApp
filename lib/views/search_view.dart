import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/city_weather/city_weather_cubit.dart';
import 'package:weather_app/services/dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/shared_reference/shared_preference.dart';

class SearchView extends StatelessWidget {
  String? cityName;

  SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CityWeatherCubit, CityWeatherState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = CityWeatherCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Search a City'),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: TextField(
                onSubmitted: (data) async {
                  cubit.search(data,context);
                },
                decoration: const InputDecoration(
                  hintText: 'Enter a City',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                  label: Text('Search'),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
