import 'package:get/get.dart';
import 'package:rfbuilder_app/screens/login.dart';
import 'package:rfbuilder_app/screens/register.dart';

List getPages = [
  GetPage(name: 'login', page: () => LoginPage()),
  GetPage(name: 'register', page: () => RegisterPage()),
];
