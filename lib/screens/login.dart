import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:rfbuilder_app/generated/l10n.dart';
import 'package:rfbuilder_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int activeIndex = 0;

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        activeIndex++;

        if (activeIndex == 4) activeIndex = 0;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
                child: Image.asset(
              "assets/images/emserLogo.png",
              height: 60,
            )),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 350,
              child: Stack(children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: AnimatedOpacity(
                    opacity: activeIndex == 0 ? 1 : 0,
                    duration: Duration(
                      seconds: 1,
                    ),
                    curve: Curves.linear,
                    child: Image.asset(
                      'assets/images/1.png',
                      height: 160,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: AnimatedOpacity(
                    opacity: activeIndex == 1 ? 1 : 0,
                    duration: Duration(seconds: 1),
                    curve: Curves.linear,
                    child: Image.asset(
                      'assets/images/2.png',
                      height: 160,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: AnimatedOpacity(
                    opacity: activeIndex == 2 ? 1 : 0,
                    duration: Duration(seconds: 1),
                    curve: Curves.linear,
                    child: Image.asset(
                      'assets/images/3.png',
                      height: 160,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: AnimatedOpacity(
                    opacity: activeIndex == 3 ? 1 : 0,
                    duration: Duration(seconds: 1),
                    curve: Curves.linear,
                    child: Image.asset(
                      'assets/images/4.png',
                      height: 160,
                    ),
                  ),
                )
              ]),
            ),
            Text(
              "Fast2Ship",
              style: TextStyle(
                  fontSize: 36,
                  fontFamily: "Titillium Web",
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                labelText: S.of(context).email,
                hintText: 'Username or e-mail',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                hintStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14.0,
                ),
                prefixIcon: Icon(
                  Iconsax.user,
                  color: Colors.red,
                  size: 18,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                floatingLabelStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 18.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                labelText: S.of(context).password,
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14.0,
                ),
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Icon(
                  Iconsax.key,
                  color: Colors.red,
                  size: 18,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                floatingLabelStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 18.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.5),
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
                    S.of(context).forgotpassword,
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
              onPressed: () {
                Get.toNamed('/home');
              },
              height: 45,
              color: Colors.red,
              child: Text(
                S.of(context).btnlogin,
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
            // No se usa por ahora
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       'Don\'t have an account?',
            //       style: TextStyle(
            //           color: Theme.of(context).primaryColor,
            //           fontSize: 14.0,
            //           fontWeight: FontWeight.w400),
            //     ),
            //     TextButton(
            //       onPressed: () {
            //         Get.toNamed('/register');
            //       },
            //       child: Text(
            //         'Register',
            //         style: TextStyle(
            //             color: Colors.red,
            //             fontSize: 14.0,
            //             fontWeight: FontWeight.w400),
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    )));
  }
}
