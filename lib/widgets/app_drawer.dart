import 'package:flutter/material.dart';
import 'package:flutter_getx_todo_app/controllers/authController.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 60,
          ),
          Card(
            child: ListTile(
              title: Text('signout'.tr),
              onTap: () {
                Get.find<AuthController>().signOut();
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('changeLocale'.tr),
              onTap: () {
                if (Get.locale.languageCode == 'en') {
                  Get.updateLocale(Locale('ar'));
                } else {
                  Get.updateLocale(Locale('en'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
