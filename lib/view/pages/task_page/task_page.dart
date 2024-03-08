import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasklogin/view/pages/home_page/home_page.dart';
import 'package:tasklogin/view/pages/login_page/login_page.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Page"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(LoginPage());
              },
              child: Text("Login Task"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(HomePage());
              },
              child: Text("CONTEST Task"),
            ),
          ],
        ),
      ),
    );
  }
}
