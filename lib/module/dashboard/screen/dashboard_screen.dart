import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qoin_test/module/dashboard/controller/dashboard_controller.dart';
import 'package:qoin_test/module/dashboard/widget/dashboard_current_weather.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (DashboardController controller) {
        return Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  const Flexible(child: SizedBox(height: double.infinity)),
                  AspectRatio(
                    aspectRatio: 355 / 200,
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              DashboardCurrentWeather(
                lastUpdate: DateTime.now(),
                location: 'Jakarta',
                weather: 'good',
              ),
            ],
          ),
        );
      },
    );
  }
}
