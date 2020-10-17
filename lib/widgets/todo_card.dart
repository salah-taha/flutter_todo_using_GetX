import 'package:flutter/material.dart';
import 'package:flutter_getx_todo_app/controllers/authController.dart';
import 'package:flutter_getx_todo_app/models/todo.dart';
import 'package:flutter_getx_todo_app/services/database.dart';
import 'package:get/get.dart';

class TodoCard extends StatelessWidget {
  final TodoModel todo;

  TodoCard({this.todo});

  void checkboxChanged(bool newVal, String todoId, String uid) async {
    await Database().changeTodoVal(newVal, todoId, uid);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          todo.content,
          style: TextStyle(
              decoration:
                  todo.done ? TextDecoration.lineThrough : TextDecoration.none),
        ),
        onLongPress: () async {
          bool delete = await Get.dialog(
            AlertDialog(
              title: Text(
                'delete'.tr,
              ),
              content: Text('${'confirmDelete'.tr} [ ${todo.content} ]'),
              actions: <Widget>[
                RaisedButton(
                  color: Colors.red,
                  onPressed: () {
                    Get.back(result: true);
                  },
                  child: Text('delete'.tr),
                ),
                FlatButton(
                  textColor: Colors.green,
                  onPressed: () {
                    Get.back(result: false);
                  },
                  child: Text('cancel'.tr),
                ),
              ],
            ),
            barrierDismissible: false,
          );
          if (delete)
            Database().deleteTodo(todo.id, Get.find<AuthController>().user.uid);
        },
        trailing: Checkbox(
          value: todo.done,
          onChanged: (newVal) {
            checkboxChanged(
                newVal, todo.id, Get.find<AuthController>().user.uid);
          },
        ),
      ),
    );
  }
}
