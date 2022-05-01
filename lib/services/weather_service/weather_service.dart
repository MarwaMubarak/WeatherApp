import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/city_weather_model.dart';
class CityWeatherService{
  String baseUrl='http://www.metaweather.com';

  Future<int?>getCityID({required String cityName})async
  {
    int? cityID;
    try{
      Uri url = Uri.parse('$baseUrl/api/location/search/?query=$cityName');
     http.Response response = await http.get(url);
     print(response.body);
     List<dynamic> data = jsonDecode(response.body);

     cityID= data[0]["woeid"];
     print(cityID);
   }catch(e){

   }
     return cityID;
  }
 Future<CityWeatherModel?> getWeather({required String cityName }) async
  {
    CityWeatherModel? cityWeatherData;
   try{
     int? id= await getCityID(cityName: cityName);
     print('idddddddddddddddddddddd  $id');
     Uri url=Uri.parse('$baseUrl/api/location/$id/');
     http.Response response = await http.get(url);
     print(response.body);
     Map<String ,dynamic> jsonData = jsonDecode(response.body);
     Map<String,dynamic> cityWeather =jsonData["consolidated_weather"][0];
     cityWeatherData = CityWeatherModel.fromJson(cityWeather);

   }
   catch(e) {
     print(e);
   }
    return cityWeatherData;



  }
}