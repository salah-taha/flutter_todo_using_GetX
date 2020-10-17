import 'package:flutter_getx_todo_app/controllers/authController.dart';
import 'package:flutter_getx_todo_app/models/todo.dart';
import 'package:flutter_getx_todo_app/services/database.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  var _todoStream = Rx<List<TodoModel>>();

  List<TodoModel> get todos => _todoStream.value;

  @override
  void onInit() {
    _todoStream
        .bindStream(Database().getTodos(Get.find<AuthController>().user.uid));
  }
}
