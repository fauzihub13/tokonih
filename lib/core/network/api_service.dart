import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_tokonih/core/constant/variables.dart';
import 'package:flutter_tokonih/core/helper/auth_local_helper.dart';

enum DioMethod { post, get, put, delete }

class ApiService {
  ApiService._singleton();

  static final ApiService instance = ApiService._singleton();
  String baseUrl = Variables.baseApiUrl;
  final AuthLocalHelper authLocalHelper = AuthLocalHelper();

  late final Dio _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {HttpHeaders.acceptHeader: 'application/json'},
        contentType: Headers.formUrlEncodedContentType,
        validateStatus: (int? status) {
          return status != null;
        },
      ),
    )
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // List of endpoints that should not include Authorization header
          // final excludedPaths = ['/login', '/register'];

          // Check if the current request path is excluded
          // if (!excludedPaths.any((path) => options.path.contains(path))) {
            // final authToken = await authLocalHelper.getAuthToken();
            // options.headers[HttpHeaders.authorizationHeader] =
            //     'Bearer $authToken';
          // }

          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            await authLocalHelper.removeAuthData();
            // RoutePage.isLoggedIn = false;
            // RoutePage.router.goNamed(RouteName.loginPage);
          }
          return handler.next(e);
        },
      ),
    );

  Future<Response> request({
    required String endpoint,
    required DioMethod method,
    Map<String, dynamic>? param,
    String? contentType,
    dynamic formData,
  }) async {
    if (contentType != null) {
      _dio.options.contentType = contentType;
    }

    switch (method) {
      case DioMethod.post:
        return _dio.post(endpoint, data: param ?? formData);
      case DioMethod.get:
        return _dio.get(endpoint, queryParameters: param);
      case DioMethod.put:
        return _dio.put(endpoint, data: param ?? formData);
      case DioMethod.delete:
        return _dio.delete(endpoint, data: param ?? formData);
    }
  }
}
