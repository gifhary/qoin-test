import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qoin_test/module/dashboard/controller/dashboard_controller.dart';
import 'package:qoin_test/module/dashboard/widget/dashboard_current_weather.dart';
import 'package:qoin_test/module/dashboard/widget/hourly_weather.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (DashboardController controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              DashboardCurrentWeather(
                iconUrl: 'http://openweathermap.org/img/wn/10d@2x.png',
                lastUpdate: DateTime.now(),
                temperature: 22,
                location: 'Jakarta',
                weather: 'good',
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
                      onTap: () {},
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
                aspectRatio: 355 / 95,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: HourlyWeather(
                      iconUrl: 'http://openweathermap.org/img/wn/10d@2x.png',
                      time: DateTime.now(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
