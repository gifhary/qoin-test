import 'package:qoin_test/api_key.dart';
import 'package:qoin_test/common/model/weather_data_model.dart';
import 'package:qoin_test/core/network/app_network_client.dart';

class DashboardNetwork {
  Future<ApiResModel> getWeatherData(
      {required double lat, required double lon}) async {
    try {
      final res = await AppNetworkClient.get(path: 'data/2.5/onecall', data: {
        'lat': lat,
        'lon': lon,
        'exclude': 'minutely',
        'units': 'metric',
        'appid': apiKey
      });

      return ApiResModel.fromMap(res.data);
    } catch (e) {
      rethrow;
    }
  }
}
