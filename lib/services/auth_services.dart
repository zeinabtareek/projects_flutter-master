import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:projects_flutter/constants.dart';
import 'package:projects_flutter/controller/auth_controller.dart';
import 'package:projects_flutter/models/user_model.dart';

class AuthServices {
  final _storage = const FlutterSecureStorage();
  final Dio _dio = Dio();

  updateStorage(UserModel userModel) async {
    await _storage.write(key: "user", value: userModel.token);
  }

  Future<UserModel?> getCurrentUser() async {
    final userToken = await _storage.read(key: "user");
    if (userToken == null) {
      return null;
    }
    Response response = await _dio.get("${K.baseUrl}/api/user",
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken'
        }));
    print(response.data);
    return UserModel.fromJson(response.data);
  }

  logOut() async {
    final userToken = await _storage.read(key: "user");
    Response response = await _dio.post("${K.baseUrl}/api/logout",
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken'
        }));
    print(response.data);
    _storage.delete(key: 'user');
    AuthController.to.changeLoggedIn(false, null); }
}
