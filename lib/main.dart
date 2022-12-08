import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:qoin_test/core/route/route.dart';
import 'package:qoin_test/core/route/route_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Qoin Test',
      theme: ThemeData.dark(),
      getPages: AppRoute.all,
      initialRoute: RouteConstant.dashboard,
      defaultTransition: Transition.cupertino,
    );
  }
}
