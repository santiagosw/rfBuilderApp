import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rfbuilder_app/provider/languageChangeProvider.dart';
import 'package:rfbuilder_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:rfbuilder_app/generated/l10n.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Iconsax.arrow_left,
            color: Colors.red,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              S.of(context).msettings,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Iconsax.box,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  S.of(context).lblapplication,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
              color: Theme.of(context).dividerColor,
            ),
            SizedBox(
              height: 10,
            ),
            GFListTile(
                title: Text(S.of(context).mdarkmode,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    )),
                icon: GFToggle(
                    disabledTrackColor: Colors.grey.shade300,
                    enabledThumbColor: Colors.white,
                    disabledThumbColor: Colors.white,
                    enabledTrackColor: Colors.red,
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      final provider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      provider.toggleTheme(value!);
                    })),
            Divider(
              height: 15,
              thickness: 2,
              color: Theme.of(context).dividerColor,
            ),
            SizedBox(height: 10),
            GFListTile(
              title: Text(S.of(context).mchanguelang,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  )),
            ),
            Row(
              children: [
                SizedBox(width: 30),
                GFButton(
                    color: Colors.red,
                    onPressed: () => context
                        .read<LanguageChangeProvider>()
                        .changeLocale("es"),
                    child: Text("Spanish")),
                SizedBox(width: 15),
                GFButton(
                    color: Colors.red,
                    onPressed: () => context
                        .read<LanguageChangeProvider>()
                        .changeLocale("en"),
                    child: Text("English")),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Get.toNamed('/login');
                },
                child: Text(S.of(context).msignout,
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 2.2,
                        color: Theme.of(context).primaryColor)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
