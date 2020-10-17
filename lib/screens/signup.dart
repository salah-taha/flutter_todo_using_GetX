import 'package:flutter/material.dart';
import 'package:flutter_getx_todo_app/controllers/authController.dart';
import 'package:get/get.dart';

class SignUp extends GetWidget<AuthController> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('signup'.tr),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(hintText: 'username'.tr),
              ),
              SizedBox(
                height: 40,
              ),
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
                          controller.createUser(nameController.text,
                              emailController.text, passwordController.text);
                        },
                  child: Text('signup'.tr),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
