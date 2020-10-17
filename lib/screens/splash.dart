import 'package:animated_splash/animated_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_todo_app/controllers/authController.dart';
import 'package:flutter_getx_todo_app/screens/home.dart';
import 'package:flutter_getx_todo_app/screens/login.dart';
import 'package:get/get.dart';

class Splash extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplash(
      imagePath: 'assets/logo.png',
      home: Obx(
        () {
          if (Get.find<AuthController>().user?.uid != null)
            return Home();
          else
            return Login();
        },
      ),
      duration: 3000,
      type: AnimatedSplashType.StaticDuration,
    );
  }
}
