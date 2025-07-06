import 'package:dartz/dartz.dart';
import 'package:flutter_tokonih/core/error/failure.dart';
import 'package:flutter_tokonih/core/helper/auth_local_helper.dart';
import 'package:flutter_tokonih/core/network/api_service.dart';
import 'package:flutter_tokonih/models/response/login_response_model.dart';

class AuthDatasource {
  final ApiService _apiService = ApiService.instance;

  Future<Either<Failure, LoginResponseModel>> login({
    required String username,
    required String password,
  }) async {
    final response = await _apiService.request(
      endpoint: '/auth/login',
      method: DioMethod.post,
      param: {'username': username, 'password': password},
    );
    if (response.statusCode == 200) {
      await AuthLocalHelper().saveAuthToken(response.data['accessToken']);
      return Right(LoginResponseModel.fromMap(response.data));
    } else {
      return Left(Failure(message: 'Failed to login, invalid credentials'));
    }
  }
}
