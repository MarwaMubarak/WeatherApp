part of 'city_weather_cubit.dart';

@immutable
abstract class CityWeatherState {}

class CityWeatherInitial extends CityWeatherState {}

class NavigationState extends CityWeatherState {}

class AssignWeatherState extends CityWeatherState {}

class SearchState extends CityWeatherState {}

class initScreenState extends CityWeatherState {}


