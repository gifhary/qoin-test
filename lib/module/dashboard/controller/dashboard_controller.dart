import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:qoin_test/common/model/weather_data_model.dart';
import 'package:qoin_test/common/widget/app_snackbar.dart';
import 'package:qoin_test/module/dashboard/data/repo/dashboard_repo.dart';

class DashboardController extends GetxController with DashboardRepo {
  bool loading = false;
  String? location;
  ApiResModel? apiRes;
  List<WeatherData> todayWeather = [];

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  _initData() async {
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
    } catch (e) {
      debugPrint(e.toString());
      AppSnackbar.error('Error', e.toString());
    }
    loading = false;
    update();
  }
}
