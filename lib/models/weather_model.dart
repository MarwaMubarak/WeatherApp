class WeatherModel {

  double? temp;
  String? weatherName;
  int? visibility;
  double? windSpeed;
  String? cityName;
  int? humidity;

  WeatherModel(
      {this.temp,
      this.weatherName,
      this.visibility,
      this.windSpeed,
      this.cityName});

  WeatherModel.fromJson(Map<dynamic, dynamic> json) {
    weatherName = json['weather'][0]['main'];
    temp = json['main']['temp'];
    visibility = json['visibility'];
    windSpeed = json['wind']['speed'];
    cityName = json['name'];
    humidity = json['main']['humidity'];
  }

  String getImage() {
    if (weatherName == 'Snow') {
      return 'assets/snow.jpg';
    } else if (weatherName == 'Sleet') {
      return 'assets/sleet.jpg';
    } else if (weatherName == 'Hail') {
      return 'assets/hail.jpg';
    } else if (weatherName == 'Thunderstorm' || weatherName == 'Thunder') {
      return 'assets/thunder_snow.jpg';
    } else if (weatherName == 'Heavy Rain') {
      return 'assets/heavy_rain.jpg';
    } else if (weatherName == 'Light Rain') {
      return 'assets/light_rain.jpg';
    } else if (weatherName == 'Showers') {
      return 'assets/shower.jpg';
    } else if (weatherName == 'Heavy Cloud') {
      return 'assets/heavy_cloud.jpg';
    } else if (weatherName == 'Light Cloud') {
      return 'assets/light_cloud.jpg';
    } else if (weatherName == 'Clear') {
      return 'assets/clear.jpg';
    } else {
      return 'assets/clear.jpg';
    }
  }
}
