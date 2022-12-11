import 'package:get/route_manager.dart';
import 'package:qoin_test/core/route/route_constant.dart';
import 'package:qoin_test/module/dashboard/screen/dashboard_screen.dart';
import 'package:qoin_test/module/tomorrow_forecast/screen/tomorrow_forecast_screen.dart';

class AppRoute {
  static final all = [
    GetPage(name: RouteConstant.dashboard, page: () => const DashboardScreen()),
    GetPage(
        name: RouteConstant.tommorowForecast,
        page: () => TomorrowForecastScreen()),
  ];
}
