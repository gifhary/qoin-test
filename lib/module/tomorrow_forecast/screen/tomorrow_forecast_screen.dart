import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qoin_test/module/tomorrow_forecast/controller/tomorrow_forecast_controller.dart';

class TomorrowForecastScreen extends StatelessWidget {
  const TomorrowForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TomorrowForecastController>(
      init: TomorrowForecastController(),
      builder: (TomorrowForecastController controller) {
        return Scaffold();
      },
    );
  }
}
