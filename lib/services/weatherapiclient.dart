import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:Vier/model/weather.dart';
import 'dart:convert';


class WeatherApi {


  //api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=8e47bcc9b16dc2294c790849c0aa2f02&units=metric

  Future<Weather> getweather({double latitude,double longitude})async{

    var url = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=8e47bcc9b16dc2294c790849c0aa2f02&units=metric';
    http.Response response = await http.get(url);

    if(response.statusCode == 200){
     print(weatherFromJson(response.body));
      return weatherFromJson(response.body);
    }else{
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }


}