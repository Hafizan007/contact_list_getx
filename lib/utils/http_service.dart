import 'dart:convert';
import 'package:dio/dio.dart';

// ignore: constant_identifier_names
enum Method { POST, GET, PUT, DELETE, PATCH }

const String baseUrl = 'http://103.172.205.222:9003';

class HttpService {
  Dio? _dio;

  header() => {
        "Content-Type": "application/json",
        "authorization": 'Basic ' +
            base64Encode(
                utf8.encode('crud:da1c25d8-37c8-41b1-afe2-42dd4825bfea'))
      };

  Future<HttpService> init() async {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: header(),
      responseType: ResponseType.json,
      connectTimeout: 3000,
      receiveTimeout: 3000,
    ));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (err, handler) {
          return handler.next(err);
        },
      ),
    );
  }

  Future<dynamic> request(
      {required String url,
      required Method method,
      Map<String, dynamic>? params}) async {
    Response response;

    try {
      if (method == Method.POST) {
        response = await _dio!.post(url, data: params);
      } else if (method == Method.DELETE) {
        response = await _dio!.delete(url, data: params);
      } else if (method == Method.PUT) {
        response = await _dio!.put(url, data: params);
      } else {
        response = await _dio!.get(url, queryParameters: params);
      }

      if (response.statusCode == 200) {
        return response;
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        if (e.response!.statusCode == 404) {
          return "404";
        } else if (e.response!.statusCode == 401) {
          return "Unauthorized";
        } else if (e.response!.statusCode == 500) {
          return "Server Error";
        } else {
          return "Something does wen't wrong";
        }
      }
      if (e.type == DioErrorType.connectTimeout) {
        return e.message;
      }
      if (e.type == DioErrorType.other) {
        return "Something does wen't wrong";
      }
    } catch (e) {
      return e.toString();
    }
  }
}
