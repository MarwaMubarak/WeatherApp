class CityWeatherModel{
     String weatherStateName;
     double temp;
     double windSpeed;
     double visibility;
     int humidity;

    CityWeatherModel({
          required this.weatherStateName,
          required this.temp,
          required this.windSpeed,
          required this.visibility,
          required this.humidity
      });
     factory CityWeatherModel.fromJson(Map<String,dynamic>data)
     {
       return CityWeatherModel(
         weatherStateName: data["weather_state_name"],
         temp:data["the_temp"] ,
         windSpeed: data["wind_speed"],
         visibility:data["visibility"],
         humidity:data["humidity"],
       );
     }

     String getImage()
     {
       if(weatherStateName=='Snow')
         return'C:/Users/Legion 5/StudioProjects/weather_app/assets/snow.jpg';
       else if(weatherStateName=='Sleet')
         return'C:/Users/Legion 5/StudioProjects/weather_app/assets/sleet.jpg';
       else if(weatherStateName=='Hail')
         return'C:/Users/Legion 5/StudioProjects/weather_app/assets/hail.jpg';
       else if(weatherStateName=='Thunderstorm'||weatherStateName=='Thunder')
         return'C:/Users/Legion 5/StudioProjects/weather_app/assets/thunder_snow.jpg';
       else if(weatherStateName=='Heavy Rain')
         return'C:/Users/Legion 5/StudioProjects/weather_app/assets/heavy_rain.jpg';
       else if(weatherStateName=='Light Rain')
         return'C:/Users/Legion 5/StudioProjects/weather_app/assets/light_rain.jpg';
       else if(weatherStateName=='Showers')
         return'C:/Users/Legion 5/StudioProjects/weather_app/assets/shower.jpg';
       else if(weatherStateName=='Heavy Cloud')
         return'C:/Users/Legion 5/StudioProjects/weather_app/assets/heavy_cloud.jpg';
       else if(weatherStateName=='Light Cloud')
         return'C:/Users/Legion 5/StudioProjects/weather_app/assets/light_cloud.jpg';
       else if(weatherStateName=='Clear')
         return'C:/Users/Legion 5/StudioProjects/weather_app/assets/clear.jpg';
       else
         return 'C:/Users/Legion 5/StudioProjects/weather_app/assets/clear.jpg';

     }

}