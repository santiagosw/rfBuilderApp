import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconsax/iconsax.dart';
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
              "Settings",
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
                  Iconsax.user,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
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
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Change password"),
            buildAccountOptionRow(context, "Language"),
            buildAccountOptionRow(context, "Privacy and security"),
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
                  "Application",
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
                title: Text('Dark mode',
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
            SizedBox(height: 10),
            GFListTile(
                title: Text('Slide menu',
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
                    value: false,
                    onChanged: (value) {})),
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
                child: Text("SIGN OUT",
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

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
