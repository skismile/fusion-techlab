import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller/auth_controller.dart';
import '../../widgets/my_textfield.dart';
import '../login_page/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final Authcontroller _authcontroller = Get.put(Authcontroller());
  final TextEditingController _numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account Page"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            MyTextfield(controller: _numberController),
            ElevatedButton(
                onPressed: () {
                  _authcontroller.registerUserData.add(_numberController.text);
                  _numberController.text = "";
                  Get.snackbar("Create Account", "Account created success");
                  Get.to(LoginPage());
                },
                child: Text("Register")),
          ],
        ),
      ),
    );
  }
}
