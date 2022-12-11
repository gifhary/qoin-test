import 'dart:convert';

class ApiResModel {
  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final WeatherData current;
  final List<WeatherData> hourly;
  final List<DailyWeatherData> daily;
  ApiResModel({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
    required this.daily,
  });

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lon': lon,
      'timezone': timezone,
      'timezone_offset': timezoneOffset,
      'current': current.toMap(),
      'hourly': hourly.map((x) => x.toMap()).toList(),
      'daily': daily.map((x) => x.toMap()).toList(),
    };
  }

  factory ApiResModel.fromMap(Map<String, dynamic> map) {
    return ApiResModel(
      lat: map['lat']?.toDouble() ?? 0.0,
      lon: map['lon']?.toDouble() ?? 0.0,
      timezone: map['timezone'] ?? '',
      timezoneOffset: map['timezone_offset']?.toInt() ?? 0,
      current: WeatherData.fromMap(map['current']),
      hourly: List<WeatherData>.from(
          map['hourly']?.map((x) => WeatherData.fromMap(x))),
      daily: List<DailyWeatherData>.from(
          map['daily']?.map((x) => DailyWeatherData.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResModel.fromJson(String source) =>
      ApiResModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ApiResModel(lat: $lat, lon: $lon, timezone: $timezone, timezoneOffset: $timezoneOffset, current: $current, hourly: $hourly, daily: $daily)';
  }
}

class DailyWeatherData {
  final DateTime dt;
  final DateTime sunrise;
  final DateTime sunset;
  final DateTime moonrise;
  final DateTime moonset;
  final double moonPhase;
  final Temp temp;
  final Temp feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final List<Weather> weather;
  final int clouds;
  final double pop;
  final double rain;
  final int uvi;
  DailyWeatherData({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.rain,
    required this.uvi,
  });

  Map<String, dynamic> toMap() {
    return {
      'dt': (dt.millisecondsSinceEpoch / 1000).round(),
      'sunrise': (sunrise.millisecondsSinceEpoch / 1000).round(),
      'sunset': (sunset.millisecondsSinceEpoch / 1000).round(),
      'moonrise': (moonrise.millisecondsSinceEpoch / 1000).round(),
      'moonset': (moonset.millisecondsSinceEpoch / 1000).round(),
      'moon_phase': moonPhase,
      'temp': temp.toMap(),
      'feels_like': feelsLike.toMap(),
      'pressure': pressure,
      'humidity': humidity,
      'dew_point': dewPoint,
      'wind_speed': windSpeed,
      'wind_deg': windDeg,
      'wind_gust': windGust,
      'weather': weather.map((x) => x.toMap()).toList(),
      'clouds': clouds,
      'pop': pop,
      'rain': rain,
      'uvi': uvi,
    };
  }

  factory DailyWeatherData.fromMap(Map<String, dynamic> map) {
    return DailyWeatherData(
      dt: DateTime.fromMillisecondsSinceEpoch(map['dt'] * 1000),
      sunrise: DateTime.fromMillisecondsSinceEpoch(map['sunrise'] * 1000),
      sunset: DateTime.fromMillisecondsSinceEpoch(map['sunset'] * 1000),
      moonrise: DateTime.fromMillisecondsSinceEpoch(map['moonrise'] * 1000),
      moonset: DateTime.fromMillisecondsSinceEpoch(map['moonset'] * 1000),
      moonPhase: map['moon_phase']?.toDouble() ?? 0.0,
      temp: Temp.fromMap(map['temp']),
      feelsLike: Temp.fromMap(map['feels_like']),
      pressure: map['pressure']?.toInt() ?? 0,
      humidity: map['humidity']?.toInt() ?? 0,
      dewPoint: map['dew_point']?.toDouble() ?? 0.0,
      windSpeed: map['wind_speed']?.toDouble() ?? 0.0,
      windDeg: map['wind_deg']?.toInt() ?? 0,
      windGust: map['wind_gust']?.toDouble() ?? 0.0,
      weather:
          List<Weather>.from(map['weather']?.map((x) => Weather.fromMap(x))),
      clouds: map['clouds']?.toInt() ?? 0,
      pop: map['pop']?.toDouble() ?? 0.0,
      rain: map['rain']?.toDouble() ?? 0.0,
      uvi: map['uvi']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DailyWeatherData.fromJson(String source) =>
      DailyWeatherData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DailyWeatherData(dt: $dt, sunrise: $sunrise, sunset: $sunset, moonrise: $moonrise, moonset: $moonset, moonPhase: $moonPhase, temp: $temp, feelsLike: $feelsLike, pressure: $pressure, humidity: $humidity, dewPoint: $dewPoint, windSpeed: $windSpeed, windDeg: $windDeg, windGust: $windGust, weather: $weather, clouds: $clouds, pop: $pop, rain: $rain, uvi: $uvi)';
  }
}

class Temp {
  final double day;
  final double? min;
  final double? max;
  final double night;
  final double eve;
  final double morn;
  Temp({
    required this.day,
    this.min,
    this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'min': min,
      'max': max,
      'night': night,
      'eve': eve,
      'morn': morn,
    };
  }

  factory Temp.fromMap(Map<String, dynamic> map) {
    return Temp(
      day: map['day']?.toDouble() ?? 0.0,
      min: map['min']?.toDouble(),
      max: map['max']?.toDouble(),
      night: map['night']?.toDouble() ?? 0.0,
      eve: map['eve']?.toDouble() ?? 0.0,
      morn: map['morn']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Temp.fromJson(String source) => Temp.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Temp(day: $day, min: $min, max: $max, night: $night, eve: $eve, morn: $morn)';
  }
}

class Rain {
  final double h1;
  Rain({
    required this.h1,
  });

  Map<String, dynamic> toMap() {
    return {
      '1h': h1,
    };
  }

  factory Rain.fromMap(Map<String, dynamic> map) {
    return Rain(
      h1: map['1h']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rain.fromJson(String source) => Rain.fromMap(json.decode(source));

  @override
  String toString() => 'Rain(h1: $h1)';
}

class WeatherData {
  final DateTime dt;
  final DateTime? sunrise;
  final DateTime? sunset;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final int uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double? windGust;
  final List<Weather> weather;
  final double? pop;
  final Rain? rain;
  WeatherData(
      {required this.dt,
      this.sunrise,
      this.sunset,
      required this.temp,
      required this.feelsLike,
      required this.pressure,
      required this.humidity,
      required this.dewPoint,
      required this.uvi,
      required this.clouds,
      required this.visibility,
      required this.windSpeed,
      required this.windDeg,
      required this.weather,
      this.windGust,
      this.pop,
      this.rain});

  Map<String, dynamic> toMap() {
    return {
      'dt': (dt.millisecondsSinceEpoch / 1000).round(),
      'sunrise': ((sunrise?.millisecondsSinceEpoch ?? 0) / 1000).round(),
      'sunset': ((sunset?.millisecondsSinceEpoch ?? 0) / 1000).round(),
      'temp': temp,
      'feels_like': feelsLike,
      'pressure': pressure,
      'humidity': humidity,
      'dew_point': dewPoint,
      'uvi': uvi,
      'clouds': clouds,
      'visibility': visibility,
      'wind_speed': windSpeed,
      'wind_deg': windDeg,
      'wind_gust': windGust,
      'weather': weather.map((x) => x.toMap()).toList(),
      'pop': pop,
      'rain': rain?.toMap()
    };
  }

  factory WeatherData.fromMap(Map<String, dynamic> map) {
    return WeatherData(
      dt: DateTime.fromMillisecondsSinceEpoch(map['dt'] * 1000),
      sunrise: map['sunrise'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['sunrise'] * 1000)
          : null,
      sunset: map['sunset'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['sunset'] * 1000)
          : null,
      rain: map['rain'] != null ? Rain.fromMap(map['rain']) : null,
      temp: map['temp']?.toDouble() ?? 0.0,
      feelsLike: map['feels_like']?.toDouble() ?? 0.0,
      pressure: map['pressure']?.toInt() ?? 0,
      humidity: map['humidity']?.toInt() ?? 0,
      dewPoint: map['dew_point']?.toDouble() ?? 0.0,
      uvi: map['uvi']?.toInt() ?? 0,
      clouds: map['clouds']?.toInt() ?? 0,
      visibility: map['visibility']?.toInt() ?? 0,
      windSpeed: map['wind_speed']?.toDouble() ?? 0.0,
      windGust: map['wind_gust']?.toDouble(),
      windDeg: map['wind_deg']?.toInt() ?? 0,
      weather:
          List<Weather>.from(map['weather']?.map((x) => Weather.fromMap(x))),
      pop: map['pop']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherData.fromJson(String source) =>
      WeatherData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeatherData(dt: $dt, sunrise: $sunrise, sunset: $sunset, temp: $temp, feelsLike: $feelsLike, pressure: $pressure, humidity: $humidity, dewPoint: $dewPoint, uvi: $uvi, clouds: $clouds, visibility: $visibility, windSpeed: $windSpeed, windDeg: $windDeg, weather: $weather)';
  }
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id']?.toInt() ?? 0,
      main: map['main'] ?? '',
      description: map['description'] ?? '',
      icon: map['icon'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Weather(id: $id, main: $main, description: $description, icon: $icon)';
  }
}
