import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tasklogin/view/pages/login_page/login_page.dart';

import 'view/pages/task_page/task_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const TaskPage(),
    );
  }
}
