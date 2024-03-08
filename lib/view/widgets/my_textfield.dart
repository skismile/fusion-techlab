import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
        height: 70,
        width: screenWidth * 0.9,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              labelText: "Please Enter Mobile No",
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black))),
        ));
  }
}
