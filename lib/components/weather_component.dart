import 'package:flutter/material.dart';
class WeatherView extends StatelessWidget {

  String ?city;
  String ?statue;
  String? image;
  int  ?humidity;
  double ?temperature;
  double ?visibility;
  double ?windSpeed;



  WeatherView(
      { required this.city,
        required this.statue,
        required this.temperature,
        required this.humidity,
        required this.visibility,
        required this.windSpeed,
        required this.image,
      }
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [

          Image.asset(image!,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black12
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 90,
                            ),
                            Text(city!,style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold,),),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text('${temperature?.toStringAsFixed(1)}\u00B0',style: TextStyle(color: Colors.white,fontSize: 60,),),
                          ],
                        ),

                      ],
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: RotatedBox(
                          child: Text('It\'s $statue',style: TextStyle(fontSize:18,color: Colors.white,fontWeight: FontWeight.bold ),),
                          quarterTurns: 3,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white30),
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text('$humidity%',style: TextStyle(color: Colors.white,fontSize: 22,),),
                                  Text('Humidity',style: TextStyle(color: Colors.white,fontSize: 15,),),

                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text('${visibility?.toStringAsFixed(1)} km',style: TextStyle(color: Colors.white,fontSize: 22,),),
                                  Text('visibility',style: TextStyle(color: Colors.white,fontSize: 15,),),

                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text('${windSpeed?.toStringAsFixed(1)}',style: TextStyle(color: Colors.white,fontSize: 22,),),
                                  Text('Wind Speed',style: TextStyle(color: Colors.white,fontSize: 15,),),

                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white30,
                          )
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
