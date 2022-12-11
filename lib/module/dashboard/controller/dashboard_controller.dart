import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:qoin_test/common/model/weather_data_model.dart';
import 'package:qoin_test/common/widget/app_snackbar.dart';
import 'package:qoin_test/module/dashboard/data/constant/dashboard_constant.dart';
import 'package:qoin_test/module/dashboard/data/repo/dashboard_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController with DashboardRepo {
  bool loading = false;
  DateTime? lastUpdate;
  String? location;
  ApiResModel? apiRes;
  List<WeatherData> todayWeather = [];

  late SharedPreferences _prefs;

  String currentIcon = '';
  double currentTemp = 0;
  String currentWeather = '';
  int currentHumidity = 0;
  double currentWindSpeed = 0;
  double currentRainChance = 0;

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  _setCurrentWeather() {
    if (apiRes == null) return;
    final now = DateTime.now();

    if (apiRes!.current.dt.day == now.day &&
        apiRes!.current.dt.month == now.month &&
        apiRes!.current.dt.year == now.year) {
      currentIcon =
          'http://openweathermap.org/img/wn/${apiRes?.current.weather.first.icon}@2x.png';
      currentTemp = apiRes!.current.temp;
      currentWeather = apiRes!.current.weather.first.main;
      currentHumidity = apiRes!.current.humidity;
      currentWindSpeed = apiRes!.current.windSpeed;
      currentRainChance = apiRes!.hourly
              .firstWhereOrNull(
                  (element) => element.dt.hour == DateTime.now().hour)
              ?.pop ??
          0;
    } else {
      final currentForecast = apiRes!.daily.firstWhereOrNull((element) =>
          element.dt.day == now.day &&
          element.dt.month == now.month &&
          element.dt.year == now.year);

      if (currentForecast == null) return;

      currentIcon =
          'http://openweathermap.org/img/wn/${currentForecast.weather.first.icon}@2x.png';
      currentTemp = currentForecast.temp.day;
      currentWeather = currentForecast.weather.first.main;
      currentHumidity = currentForecast.humidity;
      currentWindSpeed = currentForecast.windSpeed;
      currentRainChance = currentForecast.pop;
    }
  }

  _initData() async {
    try {
      _prefs = await SharedPreferences.getInstance();

      final lastUpdateData = _prefs.getInt(DashboardConstant.lastUpdateKey);
      final localForecastData = _prefs.getString(DashboardConstant.forecastKey);
      final lastLocation = _prefs.getString(DashboardConstant.lastLocationKey);

      if (lastUpdateData != null &&
          localForecastData != null &&
          lastLocation != null) {
        lastUpdate = DateTime.fromMillisecondsSinceEpoch(lastUpdateData);
        location = lastLocation;
        apiRes = ApiResModel.fromJson(localForecastData);

        todayWeather = apiRes!.hourly
            .where((element) =>
                element.dt.day == DateTime.now().day &&
                element.dt.month == DateTime.now().month &&
                element.dt.year == DateTime.now().year)
            .toList();

        _setCurrentWeather();

        update();

        if (todayWeather.isEmpty) {
          debugPrint('hourly empty');
          _getData();
        }
      } else {
        //when local data is insufficient, load latest data from api
        debugPrint('data not enough');
        _getData();
      }
    } catch (e) {
      debugPrint(e.toString());
      AppSnackbar.error('Error', e.toString());
    }
  }

  Future<void> onRefresh() async {
    await _getData();
  }

  Future<void> _getData() async {
    debugPrint('load data');
    loading = true;
    update();
    try {
      final position = await repoGetPosition();
      apiRes = await repoGetWeatherData(
          lat: position.latitude, lon: position.longitude);

      if (apiRes == null) throw 'Failed getting data';

      todayWeather = apiRes!.hourly
          .where((element) =>
              element.dt.day == DateTime.now().day &&
              element.dt.month == DateTime.now().month &&
              element.dt.year == DateTime.now().year)
          .toList();

      final places =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      location = places.first.subLocality;

      _setCurrentWeather();

      lastUpdate = DateTime.now();

      //save data locally
      _prefs.setInt(DashboardConstant.lastUpdateKey,
          DateTime.now().millisecondsSinceEpoch);
      _prefs.setString(DashboardConstant.forecastKey, apiRes!.toJson());
      _prefs.setString(DashboardConstant.lastLocationKey, location!);
    } catch (e) {
      debugPrint('error: $e');
      AppSnackbar.error('Error', e.toString());
    }
    loading = false;
    update();
  }
}
