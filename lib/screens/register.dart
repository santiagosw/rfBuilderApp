import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:rfbuilder_app/routes.dart';
import 'package:rfbuilder_app/screens/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GFAppBar(
          leading: GFIconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(LoginPage());
            },
            type: GFButtonType.transparent,
          ),
          bottomOpacity: 0.0,
          toolbarOpacity: 1.0,
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Create Account",
                  style: TextStyle(
                      fontSize: 28,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w900,
                      color: Colors.grey.shade700),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GFButton(
                      onPressed: () {},
                      text: "Register with Facebook",
                      textStyle: TextStyle(color: Colors.grey.shade700),
                      icon: Icon(Icons.facebook, color: Colors.blue),
                      type: GFButtonType.outline,
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      shape: GFButtonShape.pills,
                      fullWidthButton: true,
                    ),
                    GFButton(
                      onPressed: () {},
                      text: "Register with Google",
                      textStyle: TextStyle(color: Colors.grey.shade700),
                      icon: Icon(Icons.shop, color: Colors.red),
                      type: GFButtonType.outline,
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      shape: GFButtonShape.pills,
                      fullWidthButton: true,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "OR CREATE WITH EMAIL",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w800,
                      color: Colors.grey.shade700),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    labelText: 'Username',
                    hintText: 'Username',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    prefixIcon: Icon(
                      Iconsax.user,
                      color: Colors.red,
                      size: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 18.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    labelText: 'Email',
                    hintText: 'E-mail',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    prefixIcon: Icon(
                      Iconsax.user_add,
                      color: Colors.red,
                      size: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 18.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    labelText: 'Password',
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: Icon(
                      Iconsax.key,
                      color: Colors.red,
                      size: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {},
                  height: 45,
                  color: Colors.red,
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ));
  }
}
