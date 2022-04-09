import 'package:get/get.dart';
import 'package:projects_flutter/controller/auth_controller.dart';
import 'package:projects_flutter/models/user_model.dart';
import 'package:projects_flutter/services/login_services.dart';

class LoginController extends GetxController {
  final _services = LoginServices();
  final auth=Get.put(AuthController());
  final email = ''.obs;
  final password = ''.obs;

  login() async {
    UserModel user = await _services.login(email.value, password.value);
     auth.changeLoggedIn(true, user);
  }
}
