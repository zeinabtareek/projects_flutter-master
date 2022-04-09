 import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:projects_flutter/controller/login_controller.dart';

import '../controller/auth_controller.dart';
import '../screens/cart_screen/cart_controller/cart_controller.dart';
import '../screens/profile_screen/controller/profile_controller.dart';


class Binding extends Bindings {
  @override
  void dependencies (){
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => CartController());

  }
}