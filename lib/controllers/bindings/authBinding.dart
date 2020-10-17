import 'package:flutter_getx_todo_app/controllers/authController.dart';
import 'package:flutter_getx_todo_app/controllers/userController.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<UserController>(() => UserController());
  }
}
