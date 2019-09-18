// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Coord coord;
  List<WeatherElement> weather;
  String base;
  Main main;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;
  int id;
  String name;
  int cod;

  Weather({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.id,
    this.name,
    this.cod,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    coord: Coord.fromJson(json["coord"]),
    weather: List<WeatherElement>.from(json["weather"].map((x) => WeatherElement.fromJson(x))),
    base: json["base"],
    main: Main.fromJson(json["main"]),
    wind: Wind.fromJson(json["wind"]),
    clouds: Clouds.fromJson(json["clouds"]),
    dt: json["dt"],
    sys: Sys.fromJson(json["sys"]),
    id: json["id"],
    name: json["name"],
    cod: json["cod"],
  );

  Map<String, dynamic> toJson() => {
    "coord": coord.toJson(),
    "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
    "base": base,
    "main": main.toJson(),
    "wind": wind.toJson(),
    "clouds": clouds.toJson(),
    "dt": dt,
    "sys": sys.toJson(),
    "id": id,
    "name": name,
    "cod": cod,
  };


  Widget weathertemperature(BuildContext context,String temp){
    if(temp=='01n' || temp=='01d'){
      Widget svg = new SvgPicture.asset(
        'images/clear_sky.svg',
        width: MediaQuery.of(context).size.height/6,
        height: MediaQuery.of(context).size.width/6,
        color: Colors.white,

      );
      return svg;
    }else if(temp=='02n' || temp=='02d'){
      Widget svg = new SvgPicture.asset(
        'images/few_cloud.svg',
        width: MediaQuery.of(context).size.height/6,
        height: MediaQuery.of(context).size.width/6,
        color: Colors.white,

      );
      return svg;
    }else if(temp=='03n' || temp=='03d'){
      Widget svg = new SvgPicture.asset(
        'images/scattered_cloud.svg',
        width: MediaQuery.of(context).size.height/6,
        height: MediaQuery.of(context).size.width/6,
        color: Colors.white,

      );
      return svg;
    }else if(temp=='04n' || temp=='04d'){
      Widget svg = new SvgPicture.asset(
        'images/broken_cloud.svg',
        width: MediaQuery.of(context).size.height/6,
        height: MediaQuery.of(context).size.width/6,
        color: Colors.white,
      );
      return svg;
    }else if(temp=='09n' || temp=='09d'){
      Widget svg = new SvgPicture.asset(
        'images/shower_rain.svg',
        width: MediaQuery.of(context).size.height/6,
        height: MediaQuery.of(context).size.width/6,
        color: Colors.white,
      );
      return svg;
    }else if(temp=='10n' || temp=='10d'){
      Widget svg = new SvgPicture.asset(
        'images/rain.svg',
        width: MediaQuery.of(context).size.height/6,
        height: MediaQuery.of(context).size.width/6,
        color: Colors.white,
      );
      return svg;
    }else if(temp=='11n' || temp=='11d'){
      Widget svg = new SvgPicture.asset(
        'images/thunderstorm.svg',
        width: MediaQuery.of(context).size.height/6,
        height: MediaQuery.of(context).size.width/6,
        color: Colors.white,
      );
      return svg;
    }else if(temp=='13n' || temp=='13d'){
      Widget svg = new SvgPicture.asset(
        'images/snowflake.svg',
        width: MediaQuery.of(context).size.height/6,
        height: MediaQuery.of(context).size.width/6,
        color: Colors.white,
      );
      return svg;
    }else if(temp=='50n' || temp=='50d'){
      Widget svg = new SvgPicture.asset(
        'images/mist.svg',
        width: MediaQuery.of(context).size.height/6,
        height: MediaQuery.of(context).size.width/6,
        color: Colors.white,
      );
      return svg;
    }
    return null;
  }

}

class Clouds {
  int all;

  Clouds({
    this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
    all: json["all"],
  );

  Map<String, dynamic> toJson() => {
    "all": all,
  };
}

class Coord {
  double lon;
  double lat;

  Coord({
    this.lon,
    this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
    lon: json["lon"].toDouble(),
    lat: json["lat"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lon": lon,
    "lat": lat,
  };
}

class Main {
  double temp;
  double pressure;
  int humidity;
  double tempMin;
  double tempMax;
  double seaLevel;
  double grndLevel;

  Main({
    this.temp,
    this.pressure,
    this.humidity,
    this.tempMin,
    this.tempMax,
    this.seaLevel,
    this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: json["temp"].toDouble(),
    pressure: json["pressure"].toDouble(),
    humidity: json["humidity"],
    tempMin: json["temp_min"].toDouble(),
    tempMax: json["temp_max"].toDouble(),
    seaLevel: json["sea_level"],
    grndLevel: json["grnd_level"],
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "pressure": pressure,
    "humidity": humidity,
    "temp_min": tempMin,
    "temp_max": tempMax,
    "sea_level": seaLevel,
    "grnd_level": grndLevel,
  };
}

class Sys {
  double message;
  String country;
  int sunrise;
  int sunset;

  Sys({
    this.message,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
    message: json["message"].toDouble(),
    country: json["country"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "country": country,
    "sunrise": sunrise,
    "sunset": sunset,
  };
}

class WeatherElement {
  int id;
  String main;
  String description;
  String icon;

  WeatherElement({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherElement.fromJson(Map<String, dynamic> json) => WeatherElement(
    id: json["id"],
    main: json["main"],
    description: json["description"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": main,
    "description": description,
    "icon": icon,
  };
}

class Wind {
  double speed;
  double deg;

  Wind({
    this.speed,
    this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: json["speed"].toDouble(),
    deg: json["deg"],
  );

  Map<String, dynamic> toJson() => {
    "speed": speed,
    "deg": deg,
  };
}
