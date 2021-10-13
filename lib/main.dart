import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rfbuilder_app/screens/login.dart';
import 'package:rfbuilder_app/screens/menu.dart';
import 'package:rfbuilder_app/screens/reception/reception_page.dart';
import 'package:rfbuilder_app/screens/register.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rfbuilder_app/screens/save_reception/sreception_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: LoginPage(),
         localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
                const Locale('en', 'US'), // English
          ],
        getPages: [
          GetPage(
              name: "/login",
              page: () => LoginPage(),
              transition: Transition.cupertinoDialog),
          GetPage(
              name: "/register",
              page: () => RegisterPage(),
              transition: Transition.cupertinoDialog),
          GetPage(
              name: "/home",
              page: () => HomePage(),
              transition: Transition.cupertinoDialog),
          GetPage(
              name: "/reception",
              page: () => ReceptionPage(),
              transition: Transition.cupertinoDialog),
          GetPage(
              name: "/savereception",
              page: () => SaveReceptionPage(),
              transition: Transition.cupertinoDialog),
        ]);
  }
}
