import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AppNetworkClient {
  static final Dio _dio = Dio()..options.connectTimeout = 10000;

  static const String _baseurl = 'https://dlabs-test.irufano.com';

  AppNetworkClient._();

  static final AppNetworkClient _instance = AppNetworkClient._();

  factory AppNetworkClient() {
    return _instance;
  }

  static Future<Response> get({
    Map<String, dynamic>? data,
    String? url,
    Map<String, dynamic>? customHeader,
    required String path,
  }) async {
    try {
      final res = await _dio.get(_baseurl + path, queryParameters: data);

      debugPrint("CALLING GET ${res.requestOptions.path}");
      debugPrint("Query GET ${res.requestOptions.queryParameters}");

      return res;
    } on DioError catch (e) {
      throw _getErrorMessage(e);
    } catch (e) {
      throw "Something Went Wrong, try again later";
    }
  }

  static Future<Response> post({
    Map<String, dynamic>? data,
    String? url,
    Map<String, dynamic>? customHeader,
    required String path,
    FormData? form,
    // jsonMap for sending raw json to server
    Map<String, dynamic>? jsonMap,
  }) async {
    try {
      final res = await _dio.post(_baseurl + path,
          data: form ?? jsonMap ?? FormData.fromMap(data!));

      debugPrint("CALLING POST ${res.requestOptions.path}");

      return res;
    } on DioError catch (e) {
      throw _getErrorMessage(e);
    } catch (e) {
      throw "Something Went Wrong, try again later";
    }
  }

  static String _getErrorMessage(DioError e) {
    switch (e.type) {
      case DioErrorType.cancel:
        return 'Connection cancelled';
      case DioErrorType.connectTimeout:
        return 'Connection timed out';
      case DioErrorType.receiveTimeout:
        return 'Connection timed out';
      case DioErrorType.response:
        return '[${e.response?.statusCode}] Server Error, try again later';
      case DioErrorType.sendTimeout:
        return 'Connection timed out';
      case DioErrorType.other:
        return 'Something Went Wrong, try again later';
      default:
        return 'Something Went Wrong, try again later';
    }
  }
}
