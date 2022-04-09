import 'package:get/get.dart';
import 'package:projects_flutter/models/user_model.dart';
import 'package:projects_flutter/screens/home/home.dart';
import 'package:projects_flutter/screens/login_screen/login_screen.dart';
import 'package:projects_flutter/services/auth_services.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();
  final _isLogged = false.obs;
  final _currentUser = UserModel().obs;
  final _services = AuthServices();

  bool get isLogged => _isLogged.value;

  UserModel get currentUser => _currentUser.value;

  @override
  Future<void> onInit() async {
    ever(_isLogged, handelAuthChanged);
    var user = await _services.getCurrentUser();
    if (user != null) {
      _currentUser.value = user;
      _isLogged.value = true;
    } else {
      _isLogged.value = false;
    }
  }

  handelAuthChanged(isLoggedIn) async {
    await Future.delayed(Duration(seconds: 1));
    if (isLoggedIn) {
      Get.offAll(() => Home());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }

  changeLoggedIn(bool isLogged, UserModel? user) {
    if (isLogged) {
      _currentUser.value = user!;
      Get.offAll(() => Home());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }

  logOut() {
    _services.logOut();
  }
}
