import 'package:dio/dio.dart';
import 'package:ek/core/network/remote/api_constants.dart';
class DioHeekerPayment {
  static late Dio dio;
  static initDio() {
    dio = Dio(BaseOptions(
        baseUrl: ApiConstants.baseUrekayment,
        headers: {
          'Content-Type': 'application/json',
        },
        receiveDataWhenStatusError: true));
  }

  static Future<Response> postData(
      {required String url, Map<String, dynamic>? data}) async {
    return await dio.post(url, data: data);
  }
}
