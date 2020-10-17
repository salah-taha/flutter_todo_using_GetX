import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_todo_app/controllers/userController.dart';
import 'package:flutter_getx_todo_app/models/user.dart';
import 'package:flutter_getx_todo_app/services/database.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var _firebaseUser = Rx<FirebaseUser>();
  var loading = false.obs;

  FirebaseUser get user => _firebaseUser.value;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.onAuthStateChanged);
    ever(_firebaseUser, (_) async {
      if (_ != null) {
        Get.find<UserController>().user = await Database().getUser(_.uid);
      }
    });
  }

  void createUser(String name, String email, String password) async {
    try {
      loading.value = true;
      AuthResult _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      UserModel _user =
          UserModel(id: _authResult.user.uid, name: name, email: email);
      await Database().createNewUser(_user);

      loading.toggle();
      Get.back();
    } catch (e) {
      loading.toggle();
      displayError(e);
    }
  }

  void login(String email, String password) async {
    try {
      loading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      loading.toggle();
    } catch (e) {
      loading.toggle();
      displayError(e);
    }
  }

  void signOut() async {
    try {
      loading.value = true;
      await _auth.signOut();
      Get.find<UserController>().clear();
      loading.toggle();
    } catch (e) {
      loading.toggle();
      displayError(e);
    }
  }

  void displayError(dynamic e) {
    Get.snackbar(
      "error".tr,
      e.message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
    );
  }
}
