import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_tokonih/models/response/login_response_model.dart';

class AuthLocalHelper {
  final storage = FlutterSecureStorage();

  Future<void> saveAuthData(LoginResponseModel loginResponseModel) async {
    await storage.write(key: 'auth_data', value: loginResponseModel.toJson());
  }

  Future<void> saveAuthToken(String token) async {
    await storage.write(key: 'auth_token', value: token);
  }

  Future<void> removeAuthData() async {
    await storage.delete(key: 'auth_data');
  }

  Future<bool> isAuthDataExist() async {
    String? value = await storage.read(key: 'auth_data');
    return value != null;
  }

  Future<LoginResponseModel> getAuthData() async {
    String? value = await storage.read(key: 'auth_data');
    final userModel = LoginResponseModel.fromJson(value!);
    return userModel;
  }

  Future<String> getAuthToken() async {
    String? value = await storage.read(key: 'auth_token');
    return value!;
  }
}
