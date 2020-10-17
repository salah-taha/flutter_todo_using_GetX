import 'package:flutter/material.dart';
import 'package:flutter_getx_todo_app/controllers/authController.dart';
import 'package:flutter_getx_todo_app/services/database.dart';
import 'package:get/get.dart';

class AddTodo extends StatelessWidget {
  final TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextFormField(
                controller: todoController,
                decoration: InputDecoration(hintText: 'title'.tr),
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                if (todoController.text.isNotEmpty) {
                  Database().addTodo(
                      todoController.text, Get.find<AuthController>().user.uid);
                  todoController.clear();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
