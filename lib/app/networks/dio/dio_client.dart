import 'package:dio/dio.dart';
import 'package:e_commerse/app/modules/data/url.dart';
import 'package:e_commerse/app/networks/dio/endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ),
    );
  }

  Future<dynamic> mainReqRes({
    required Endpoints endPoints,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    String? queryParameters,
  }) async {
    Response response;
    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }
    if (endPoints.hasToken()) {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      final _token = sp.getString("token");
      _dio.options.headers
          .addAll({"Authorization": "Bearer ${_token ?? "No Token"}"});
    }
    try {
      switch (endPoints.type()) {
        case ReqType.GET:
          response = await _dio.get(
            queryParameters != null
                ? "$BASE_URl/${endPoints.path()}/$queryParameters"
                : "$BASE_URl/${endPoints.path()}",
            queryParameters: data,
          );
          break;
        case ReqType.POST:
          response = await _dio.post(
            queryParameters != null
                ? "$BASE_URl/${endPoints.path()}/$queryParameters"
                : "$BASE_URl/${endPoints.path()}",
            data: data,
          );
          break;
        case ReqType.PUT:
          response = await _dio.put(
            queryParameters != null
                ? "$BASE_URl/${endPoints.path()}/$queryParameters"
                : "$BASE_URl/${endPoints.path()}",
            data: data,
          );
          break;
        case ReqType.DELETE:
          response = await _dio.delete(
            queryParameters != null
                ? "$BASE_URl/${endPoints.path()}/$queryParameters"
                : "$BASE_URl/${endPoints.path()}",
            data: data,
          );
        default:
          response = await _dio.post(
            "$BASE_URl/${endPoints.path()}",
            data: data,
          );
      }
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response!;
      } else {
        switch (e.type) {
          case DioException.receiveTimeout:
            response = Response(
              requestOptions: e.requestOptions,
              statusMessage: "Received time out",
              statusCode: 700,
            );
            break;
          default:
            response = Response(
              requestOptions: e.requestOptions,
              statusMessage: "Some error happened",
              statusCode: 800,
            );
        }
      }
      return response;
    }
  }
}

enum ReqType { GET, POST, PUT, DELETE }
