import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rfbuilder_app/screens/login.dart';
import 'package:rfbuilder_app/screens/menu.dart';
import 'package:rfbuilder_app/screens/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: LoginPage());
  }
}
