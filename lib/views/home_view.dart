import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/city_weather_cubit.dart';
import 'package:weather_app/components/weather_component.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CityWeatherCubit, CityWeatherState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit=CityWeatherCubit.get(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon:Icon(
          Icons.search,
          size: 30,
          color: Colors.black,
        ),
        onPressed: ()
        {
          /// ToDo to search page
          /// Navigator.push(context,MaterialPageRoute(builder:(context)=>SearchView(updateUi:updateUi,));
          cubit.Navigation(context);
        },
      ),
    ),
      body: cubit.cityWeather==null?
    Center(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Not Found a City!!',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text('Please Search a City..',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

        ],
        ),
      ),
    ):WeatherView(city: cubit.CityName,
          statue: cubit.cityWeather?.weatherStateName,
          temperature: cubit.cityWeather?.temp,
          humidity: cubit.cityWeather?.humidity,
          visibility: cubit.cityWeather?.visibility,
          windSpeed: cubit.cityWeather?.windSpeed,
          image: cubit.Image)

    );
  },
);}
}
