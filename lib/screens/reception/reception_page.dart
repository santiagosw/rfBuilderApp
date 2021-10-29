import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:rfbuilder_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ReceptionPage extends StatefulWidget {
  const ReceptionPage({Key? key}) : super(key: key);

  @override
  _ReceptionPageState createState() => _ReceptionPageState();
}

class _ReceptionPageState extends State<ReceptionPage> {
  late ScrollController _scrollController;
  bool _isScrolled = false;
  String? dropdown;
  String barcode = '00000000';

  List<dynamic> _services = [
    ['Dashboard', Iconsax.home, Colors.white],
    ['Tasks', Iconsax.task, Colors.white],
    ['Contacts', Iconsax.profile_2user, Colors.white],
    ['Settings', Iconsax.setting, Colors.white],
    ['Support', Iconsax.support, Colors.white],
    ['Dark Mode', Iconsax.moon, Colors.white],
    ['Slide Menu', Iconsax.menu, Colors.white],
    ['Sign Out', Iconsax.logout, Colors.white],
  ];

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);

    super.initState();
  }

  void _listenToScrollChange() {
    if (_scrollController.offset >= 100.0) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  final _advancedDrawerController = AdvancedDrawerController();
  final GFBottomSheetController _controller = GFBottomSheetController();

  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';

    return AdvancedDrawer(
      backdropColor: Colors.grey.shade900,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900,
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: Offset(-20.0, 0.0),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      drawer: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          child: ListTileTheme(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 80.0,
                    height: 80.0,
                    margin: EdgeInsets.only(
                      left: 20,
                      top: 24.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/images/user.png')),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    "User",
                    style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Spacer(),
                Divider(
                  color: Colors.grey.shade800,
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed('/home');
                  },
                  leading: Icon(Iconsax.home, color: Colors.red),
                  title: Text(
                    'Dashboard',
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Iconsax.task, color: Colors.red),
                  title: Text(
                    'Tasks',
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Iconsax.profile_2user, color: Colors.red),
                  title: Text(
                    'Contacts',
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
                Divider(color: Colors.grey.shade800),
                ListTile(
                  onTap: () {},
                  leading: Icon(Iconsax.setting_2, color: Colors.red),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Iconsax.support, color: Colors.red),
                  title: Text(
                    'Support',
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
                Divider(color: Colors.grey.shade800),
                ListTile(
                  onTap: () {},
                  leading: Icon(Iconsax.moon, color: Colors.red),
                  title: Text(
                    'Dark Mode',
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  trailing: GFToggle(
                    onChanged: (value) {
                      final provider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      provider.toggleTheme(value!);
                    },
                    value: false,
                    type: GFToggleType.android,
                    enabledThumbColor: Colors.red,
                    disabledThumbColor: Colors.grey.shade300,
                    enabledTrackColor: Colors.grey.shade300,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Iconsax.menu, color: Colors.red),
                  title: Text(
                    'Slide Menu',
                    style: TextStyle(color: Theme.of(context).hintColor),
                  ),
                  trailing: Icon(Iconsax.arrow_circle_up, color: Colors.red),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed('/login');
                  },
                  leading: Icon(Iconsax.logout, color: Colors.red),
                  title: Text('Sign Out',
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                      )),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Version 1.1.0',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          bottomSheet: GFBottomSheet(
            animationDuration: 20,
            controller: _controller,
            maxContentHeight: 150,
            enableExpandableContent: false,
            stickyHeaderHeight: 50,
            stickyHeader: Container(
              child: Center(
                child: Icon(
                  Iconsax.more,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.red,
                  boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 0)]),
            ),
            contentBody: SizedBox(
              height: 20,
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                padding: EdgeInsets.only(top: 20),
                height: 70,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _services.length,
                  itemBuilder: (context, index) {
                    return FadeInDown(
                      duration: Duration(milliseconds: (index + 1) * 100),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).canvasColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Icon(
                                    _services[index][1],
                                    color: Colors.red,
                                    size: 25,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _services[index][0],
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          body: CustomScrollView(controller: _scrollController, slivers: [
            SliverAppBar(
              expandedHeight: 150.0,
              elevation: 0,
              pinned: true,
              stretch: true,
              toolbarHeight: 80,
              backgroundColor: Theme.of(context).cardColor,
              leading: IconButton(
                color: Colors.red,
                onPressed: _handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: Duration(milliseconds: 250),
                      child: Icon(
                        value.visible ? Iconsax.close_square : Iconsax.menu,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Iconsax.notification, color: Colors.red),
                  onPressed: () {
                    scanBarcode;
                  },
                ),
                IconButton(
                  icon: Icon(Iconsax.message_question, color: Colors.red),
                  onPressed: () => showAlertDialog(context),
                ),
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              centerTitle: true,
              title: AnimatedOpacity(
                opacity: _isScrolled ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Column(
                  children: [
                    Text(
                      '\Reception',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 30,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                titlePadding: const EdgeInsets.only(left: 20, right: 20),
                title: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _isScrolled ? 0.0 : 1.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FadeIn(
                        duration: const Duration(milliseconds: 500),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              'Reception',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 30,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FadeInDown(
                      duration: Duration(milliseconds: 500),
                      child: Column(children: [
                        TextField(
                          cursorColor: Theme.of(context).cursorColor,
                          decoration: InputDecoration(
                            prefixText: '$barcode',
                            prefixStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                            suffix: IconButton(
                                onPressed: scanBarcode,
                                icon: Icon(
                                  Iconsax.camera,
                                  color: Colors.red,
                                )),
                            contentPadding: EdgeInsets.all(0.0),
                            labelText: 'Position',
                            labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                            prefixIcon: Icon(
                              Iconsax.location,
                              color: Colors.red,
                              size: 18,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade200, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 18.0,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.5),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          cursorColor: Theme.of(context).cursorColor,
                          decoration: InputDecoration(
                            prefixText: '$barcode',
                            prefixStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                            suffix: IconButton(
                                onPressed: scanBarcode,
                                icon: Icon(
                                  Iconsax.camera,
                                  color: Colors.red,
                                )),
                            contentPadding: EdgeInsets.all(0.0),
                            labelText: 'Product',
                            labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                            prefixIcon: Icon(
                              Iconsax.box,
                              color: Colors.red,
                              size: 18,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade200, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 18.0,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.5),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(
                          color: Theme.of(context).dividerColor,
                        ),
                        SizedBox(height: 10),
                        TextField(
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 8,
                          cursorColor: Theme.of(context).cursorColor,
                          decoration: InputDecoration(
                            errorMaxLines: 8,
                            helperMaxLines: 8,
                            hintText: 'type here a description',
                            labelText: 'Description',
                            labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                            suffixIcon: Icon(Iconsax.text, color: Colors.red),
                            hintStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade200, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 18.0,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.5),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(color: Theme.of(context).dividerColor),
                        SizedBox(height: 10),
                        TextField(
                          keyboardType: TextInputType.datetime,
                          cursorColor: Theme.of(context).cursorColor,
                          decoration: InputDecoration(
                            prefixText: '$barcode',
                            prefixStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                            suffix: IconButton(
                                onPressed: scanBarcode,
                                icon: Icon(
                                  Iconsax.camera,
                                  color: Colors.red,
                                )),
                            contentPadding: EdgeInsets.all(0.0),
                            labelText: 'Expiration',
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
                              Iconsax.box_time,
                              color: Colors.red,
                              size: 18,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade200, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 18.0,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.5),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          keyboardType: TextInputType.number,
                          cursorColor: Theme.of(context).cursorColor,
                          decoration: InputDecoration(
                            prefixText: '$barcode',
                            prefixStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                            suffix: IconButton(
                                onPressed: scanBarcode,
                                icon: Icon(
                                  Iconsax.camera,
                                  color: Colors.red,
                                )),
                            contentPadding: EdgeInsets.all(0.0),
                            labelText: 'Amount',
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
                              Iconsax.box_add,
                              color: Colors.red,
                              size: 18,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade200, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 18.0,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.5),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(20),
                          child: DropdownButtonHideUnderline(
                            child: GFDropdown(
                              dropdownColor: Theme.of(context).accentColor,
                              icon: Icon(Iconsax.unlimited),
                              hint: Text(
                                'CM',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                              padding: const EdgeInsets.all(15),
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  const BorderSide(color: Colors.red, width: 1),
                              dropdownButtonColor:
                                  Theme.of(context).accentColor,
                              onChanged: (newValue) {
                                setState(() {});
                              },
                              items: ['CM', 'MM', 'LT', 'DC']
                                  .map((value) => DropdownMenuItem(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            )
          ])),
    );
  }

  void showAlertDialog(BuildContext context) => showDialog(
        builder: (context) => AlertDialog(
          title: Text('Reception Task'),
          content: Text(
            'Reception Task Info',
          ),
          actions: [
            OutlineButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Close',
              ),
              color: Colors.red,
            )
          ],
        ),
        context: context,
      );

  Future<void> scanBarcode() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );

      if (!mounted) return;

      setState(() {
        this.barcode = barcode;
      });
    } on PlatformException {
      barcode = 'Failed to get platform version.';
    }
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
