import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:rfbuilder_app/provider/languageChangeProvider.dart';
import 'package:rfbuilder_app/provider/theme_provider.dart';
import 'package:rfbuilder_app/screens/bot/bot_screen.dart';
import 'package:rfbuilder_app/screens/bot/chat.dart';
import 'package:rfbuilder_app/screens/login.dart';
import 'package:rfbuilder_app/screens/menu.dart';
import 'package:rfbuilder_app/screens/picking/containerNum_page.dart';
import 'package:rfbuilder_app/screens/picking/picking_page.dart';
import 'package:rfbuilder_app/screens/reception/reception_page.dart';
import 'package:rfbuilder_app/screens/replacement/replacement_page.dart';
import 'package:rfbuilder_app/screens/save_reception/sreception_page.dart';
import 'package:rfbuilder_app/screens/settings_page/edit_profile.dart';
import 'package:rfbuilder_app/screens/settings_page/settings_page.dart';
import 'package:rfbuilder_app/screens/statisticscontroller/statistics_page.dart';
import 'package:rfbuilder_app/screens/stock/stock_page.dart';
import 'package:rfbuilder_app/screens/support/onboarding_page.dart';
import 'package:rfbuilder_app/screens/transfers/transfers.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// @dart=2.9

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return ChangeNotifierProvider<LanguageChangeProvider>(
            create: (context) => LanguageChangeProvider(),
            child: Builder(
                builder: (context) => GetMaterialApp(
                    localizationsDelegates: [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    title: 'RFBuilder',
                    themeMode: themeProvider.themeMode,
                    theme: MyThemes.lightTheme,
                    darkTheme: MyThemes.darkTheme,
                    debugShowCheckedModeBanner: false,
                    initialRoute: "/login",
                    getPages: [
                      GetPage(
                          name: "/login",
                          page: () => LoginPage(),
                          transition: Transition.cupertinoDialog),
                      GetPage(
                          name: "/home",
                          page: () => HomePage(),
                          transition: Transition.cupertinoDialog),
                      GetPage(
                          name: "/transfers",
                          page: () => TransferPage(),
                          transition: Transition.cupertinoDialog),
                      GetPage(
                          name: "/reception",
                          page: () => ReceptionPage(),
                          transition: Transition.cupertinoDialog),
                      GetPage(
                          name: "/savereception",
                          page: () => SaveReceptionPage(),
                          transition: Transition.cupertinoDialog),
                      GetPage(
                          name: "/containernum",
                          page: () => ContainerNum(),
                          transition: Transition.cupertinoDialog),
                      GetPage(
                          name: "/picking",
                          page: () => PickingPage(),
                          transition: Transition.cupertinoDialog),
                      GetPage(
                          name: "/stock",
                          page: () => StockPage(),
                          transition: Transition.cupertinoDialog),
                      GetPage(
                          name: "/replacement",
                          page: () => ReplacementPage(),
                          transition: Transition.cupertinoDialog),
                      GetPage(
                          name: "/editprofile",
                          page: () => EditProfilePage(),
                          transition: Transition.cupertinoDialog),
                      GetPage(
                          name: "/settings",
                          page: () => SettingsPage(),
                          transition: Transition.cupertinoDialog),
                      GetPage(
                          name: "/support",
                          page: () => OnBoardingPage(),
                          transition: Transition.cupertinoDialog),
                      GetPage(
                          name: "/stats",
                          page: () => StatisticsPage(
                                title: '',
                              ),
                          transition: Transition.cupertinoDialog),
                      GetPage(
                          name: "/chatbot",
                          page: () => ChatBot(),
                          transition: Transition.cupertinoDialog),
                    ])));
      });
}
