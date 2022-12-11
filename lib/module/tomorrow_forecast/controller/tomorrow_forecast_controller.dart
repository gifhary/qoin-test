import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qoin_test/common/model/weather_data_model.dart';
import 'package:qoin_test/module/tomorrow_forecast/data/repo/tomorrow_forecast_repo.dart';

class TomorrowForecastController extends GetxController
    with TomorrowForecastRepo {
  late ApiResModel data;
  DailyWeatherData? tomorrowWeather;

  TomorrowForecastController(this.data) {
    //get tomorrow data
    final now = DateTime.now();
    tomorrowWeather = data.daily.firstWhereOrNull((element) =>
        element.dt.day == (now.day + 1) &&
        element.dt.month == now.month &&
        element.dt.year == now.year);

    debugPrint(tomorrowWeather.toString());

    //remove today data
    data.daily.removeWhere((element) =>
        element.dt.day == now.day &&
        element.dt.month == now.month &&
        element.dt.year == now.year);
  }
}
