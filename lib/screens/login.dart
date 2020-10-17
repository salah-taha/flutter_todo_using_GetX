import 'package:flutter/material.dart';
import 'package:flutter_getx_todo_app/controllers/authController.dart';
import 'package:flutter_getx_todo_app/screens/signup.dart';
import 'package:get/get.dart';

class Login extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'.tr),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'email'.tr),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'password'.tr),
                obscureText: true,
              ),
              Obx(
                () => RaisedButton(
                  onPressed: controller.loading.value
                      ? null
                      : () {
                          controller.login(
                              emailController.text, passwordController.text);
                        },
                  child: Text('login'.tr),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Get.to(SignUp());
                },
                child: Text('signup'.tr),
              ),
              FlatButton(
                  onPressed: () {
                    if (Get.locale.languageCode == 'en') {
                      Get.updateLocale(Locale('ar'));
                    } else {
                      Get.updateLocale(Locale('en'));
                    }
                  },
                  child: Text('changeLocale'.tr)),
            ],
          ),
        ),
      ),
    );
  }
}
