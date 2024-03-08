import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasklogin/controller/auth_controller/auth_controller.dart';
import 'package:tasklogin/view/pages/home_page/home_page.dart';
import 'package:tasklogin/view/pages/signup_page/signup_page.dart';
import 'package:tasklogin/view/widgets/my_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Authcontroller _authcontroller = Get.put(Authcontroller());
  final TextEditingController _numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Signin Page"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            MyTextfield(controller: _numberController),
            ElevatedButton(
                onPressed: () {
                  _authcontroller.registerUserData
                          .contains(_numberController.text)
                      ? {
                          Get.snackbar("Auth", "Login Success"),
                          Get.to(HomePage(),
                              arguments: {"number": _numberController.text})
                        }
                      : {
                          Get.snackbar("Auth Failed", "User Not Found",
                              backgroundColor: Colors.red),
                        };
                },
                child: Text("Login")),
            InkWell(
              onTap: () {
                Get.to(SignupPage());
              },
              child: Text("Create Account"),
            )
          ],
        ),
      ),
    );
  }
}
