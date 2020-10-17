import 'package:flutter/material.dart';
import 'package:flutter_getx_todo_app/controllers/bindings/authBinding.dart';
import 'package:flutter_getx_todo_app/screens/splash.dart';
import 'package:flutter_getx_todo_app/utils/locales.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Locales(),
      locale: Locale('ar'),
      initialBinding: AuthBinding(),
      home: Splash(),
    );
  }
}
