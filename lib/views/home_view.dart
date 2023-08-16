import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/city_weather/city_weather_cubit.dart';
import 'package:weather_app/components/weather_component.dart';
import 'package:weather_app/services/shared_reference/shared_preference.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CityWeatherCubit, CityWeatherState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = CityWeatherCubit.get(context);
        cubit.initScreen();
        return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: () {
                  /// ToDo to search page
                  cubit.navigation(context);
                },
              ),
            ),
            body: cubit.cityWeather == null
                ? Center(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Not Found a City!!',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Please Search a City..',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                : WeatherComponent(
                    city: cubit.cityWeather?.cityName,
                    statue: cubit.cityWeather?.weatherName,
                    temperature: cubit.cityWeather?.temp,
                    humidity: cubit.cityWeather?.humidity,
                    visibility: cubit.cityWeather?.visibility,
                    windSpeed: cubit.cityWeather?.windSpeed,
                    image: cubit.image));
      },
    );
  }
}
