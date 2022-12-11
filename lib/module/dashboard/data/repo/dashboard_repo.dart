import 'package:geolocator/geolocator.dart';
import 'package:qoin_test/common/model/weather_data_model.dart';
import 'package:qoin_test/module/dashboard/data/network/dashboard_network.dart';

class DashboardRepo {
  final _myNetwork = DashboardNetwork();

  Future<ApiResModel> repoGetWeatherData(
      {required double lat, required double lon}) async {
    try {
      return await _myNetwork.getWeatherData(lat: lat, lon: lon);
    } catch (e) {
      rethrow;
    }
  }

  Future<Position> repoGetPosition() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw 'Location services are disabled';
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw 'Location permissions are denied';
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw 'Location permissions are permanently denied, we cannot request permissions.';
      }

      return await Geolocator.getCurrentPosition();
    } catch (e) {
      rethrow;
    }
  }
}
