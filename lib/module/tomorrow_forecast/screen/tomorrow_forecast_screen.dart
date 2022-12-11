import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qoin_test/common/model/weather_data_model.dart';
import 'package:qoin_test/module/tomorrow_forecast/controller/tomorrow_forecast_controller.dart';
import 'package:qoin_test/module/tomorrow_forecast/widget/tomorrow_weather.dart';

class TomorrowForecastScreen extends StatelessWidget {
  TomorrowForecastScreen({Key? key}) : super(key: key);
  final ApiResModel? data = Get.arguments as ApiResModel?;

  @override
  Widget build(BuildContext context) {
    if (data == null) throw 'Forecast data cannot be empty';
    return GetBuilder<TomorrowForecastController>(
      init: TomorrowForecastController(data!),
      builder: (TomorrowForecastController controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              TomorrowWeather(
                iconUrl:
                    'http://openweathermap.org/img/wn/${controller.tomorrowWeather?.weather.first.icon}@2x.png',
                weather: controller.tomorrowWeather!.weather.first.main,
                dayTemp: controller.tomorrowWeather?.temp.day.round() ?? 0,
                minTemp: controller.tomorrowWeather?.temp.min?.round() ?? 0,
                windSpeed: controller.tomorrowWeather?.windSpeed ?? 0,
                humidity: controller.tomorrowWeather?.humidity ?? 0,
                rainChance: controller.tomorrowWeather?.pop ?? 0,
              ),
            ],
          ),
        );
      },
    );
  }
}
