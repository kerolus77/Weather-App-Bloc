import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../utils/urls.dart';

class DioService {
  static DioService? _instance;
  late Dio _dio;

  DioService._() {
    _dio = Dio();
    BaseOptions baseOptions = BaseOptions(
      baseUrl: Urls.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 90),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    _dio.options = baseOptions;

    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: false,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  static DioService get instance {
    _instance ??= DioService._();
    return _instance!;
  }

  static Dio get dio => instance._dio;

  Future<Map<String, String>> getHeaders({bool withToken = true}) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    return headers;
  }

  Future<Response> sendRequest({
    required String method,
    required String path,
    dynamic data,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParams,
        options: Options(
          sendTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
          method: method,
          headers: headers ?? _dio.options.headers,
        ),
      );
      return response;
    } on DioException {
      rethrow;
    }
  }
}
