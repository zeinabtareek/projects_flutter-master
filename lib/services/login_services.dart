import 'package:dio/dio.dart';
import 'package:projects_flutter/constants.dart';
import 'package:projects_flutter/models/user_model.dart';
import 'package:projects_flutter/services/auth_services.dart';

class LoginServices {
  final _services = AuthServices();
  final Dio _dio = Dio();
  UserModel? userModel;

  Future login(String email, String password) async {
    try {
      Response response = await _dio.post(
          "${K.baseUrl}/api/login",
          data: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        print(response.data);
        userModel = UserModel.fromJson(response.data);
        _services.updateStorage(userModel!);
      }
    } catch (e) {
      print(e);
    }
    return userModel;
  }
}
