import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qoin_test/core/route/route_constant.dart';
import 'package:qoin_test/module/dashboard/controller/dashboard_controller.dart';
import 'package:qoin_test/module/dashboard/widget/dashboard_current_weather.dart';
import 'package:qoin_test/module/dashboard/widget/hourly_weather.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (DashboardController controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              DashboardCurrentWeather(
                loading: controller.loading,
                iconUrl:
                    'http://openweathermap.org/img/wn/${controller.apiRes?.current.weather.first.icon}@2x.png',
                lastUpdate: DateTime.now(),
                temperature: controller.apiRes?.current.temp ?? 0,
                location: controller.location ?? '',
                weather: controller.apiRes?.current.weather.first.main,
                humdity: controller.apiRes?.current.humidity ?? 0,
                windSpeed: controller.apiRes?.current.windSpeed ?? 0,
                rainChance: controller.apiRes?.hourly
                        .firstWhereOrNull(
                            (element) => element.dt.hour == DateTime.now().hour)
                        ?.pop ??
                    0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 13, 40, 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Today',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                    InkWell(
                      onTap: () => Get.toNamed(RouteConstant.tommorowForecast,
                          arguments: controller.apiRes),
                      child: Row(
                        children: [
                          Text(
                            '7 days',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.6)),
                          ),
                          Icon(Icons.keyboard_arrow_right,
                              size: 20, color: Colors.white.withOpacity(0.6)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AspectRatio(
                aspectRatio: width / (height * 0.16),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.todayWeather.length,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: HourlyWeather(
                          temperature: controller.todayWeather[index].temp,
                          iconUrl:
                              'http://openweathermap.org/img/wn/${controller.todayWeather[index].weather.first.icon}@2x.png',
                          time: controller.todayWeather[index].dt,
                          current: DateTime.now().hour ==
                              controller.todayWeather[index].dt.hour,
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
