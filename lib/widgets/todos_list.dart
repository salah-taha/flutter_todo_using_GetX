import 'package:flutter/material.dart';
import 'package:flutter_getx_todo_app/controllers/todoController.dart';
import 'package:flutter_getx_todo_app/models/todo.dart';
import 'package:flutter_getx_todo_app/widgets/todo_card.dart';
import 'package:get/get.dart';

class TodosList extends StatelessWidget {
  const TodosList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetX(
        init: Get.put<TodoController>(TodoController()),
        builder: (_) {
          if (_ != null) {
            if (_.todos != null) {
              if (_.todos.length == 0) {
                return Center(
                  child: Text('noData'.tr),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                itemCount: _.todos.length,
                itemBuilder: (context, index) {
                  TodoModel todo = _.todos[index];
                  return TodoCard(todo: todo);
                },
              );
            }
          }
          return Center(
            child: Text('loading'.tr),
          );
        },
      ),
    );
  }
}
