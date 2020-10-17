import 'package:flutter/material.dart';
import 'package:flutter_getx_todo_app/controllers/authController.dart';
import 'package:flutter_getx_todo_app/controllers/userController.dart';
import 'package:flutter_getx_todo_app/widgets/add_todo.dart';
import 'package:flutter_getx_todo_app/widgets/app_drawer.dart';
import 'package:flutter_getx_todo_app/widgets/todos_list.dart';
import 'package:get/get.dart';

class Home extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('home'.tr),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Obx(() {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(Get.find<UserController>().user?.name == null
                  ? 'loading'.tr
                  : '${'welcome'.tr} ${Get.find<UserController>().user.name}'),
            );
          }),
          AddTodo(),
          TodosList(),
        ],
      ),
    );
  }
}
