import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:rfbuilder_app/generated/l10n.dart';
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
  String? scanResult;
  String? barcode;

  final List<dynamic> _advancewunites = [
    ['Unidad de Medida', Iconsax.transaction_minus, 'CM'],
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
  final focus = FocusNode();
  final focus1 = FocusNode();
  final focus2 = FocusNode();
  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';

    return AdvancedDrawer(
      backdropColor: Theme.of(context).splashColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
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
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    S.of(context).suser,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed('/home');
                  },
                  leading: Icon(Iconsax.task, color: Colors.red),
                  title: Text(
                    S.of(context).mtask,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed('/stats');
                  },
                  leading: Icon(Iconsax.diagram, color: Colors.red),
                  title: Text(
                    S.of(context).mstatis,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Divider(color: Colors.grey.shade800),
                ListTile(
                  onTap: () {
                    Get.toNamed('/editprofile');
                  },
                  leading: Icon(Iconsax.setting_2, color: Colors.red),
                  title: Text(
                    S.of(context).msettings,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed('/support');
                  },
                  leading: Icon(Iconsax.support, color: Colors.red),
                  title: Text(
                    S.of(context).msupport,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Divider(color: Colors.grey.shade800),
                ListTile(
                  onTap: () {
                    Get.toNamed('/login');
                  },
                  leading: Icon(Iconsax.logout, color: Colors.red),
                  title: Text(S.of(context).msignout,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      )),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Version 1.1.0',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
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
                  icon: Icon(Iconsax.messages, color: Colors.red),
                  onPressed: () {
                    Get.toNamed("/chatbot");
                  },
                ),
                IconButton(
                  icon: Icon(Iconsax.info_circle, color: Colors.red),
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
                      S.of(context).tltreception,
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
                              S.of(context).tltreception,
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
                        child: Column(
                          children: [
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (v) {
                                FocusScope.of(context).requestFocus(focus);
                              },
                              cursorColor: Theme.of(context).cursorColor,
                              decoration: InputDecoration(
                                prefixText:
                                    scanResult == null ? '' : '$scanResult',
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
                                labelText: S.of(context).tfposition,
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
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18.0,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade200, width: 1.5),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              focusNode: focus,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (v) {
                                FocusScope.of(context).requestFocus(focus1);
                              },
                              cursorColor: Theme.of(context).cursorColor,
                              decoration: InputDecoration(
                                prefixText:
                                    scanResult == null ? '' : '$scanResult',
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
                                labelText: S.of(context).tfproduct,
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
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18.0,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade200, width: 1.5),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Divider(
                              color: Theme.of(context).dividerColor,
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              enableInteractiveSelection: true,
                              readOnly: true,
                              keyboardType: TextInputType.multiline,
                              minLines: 1,
                              maxLines: 8,
                              cursorColor: Theme.of(context).cursorColor,
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                errorMaxLines: 8,
                                helperMaxLines: 8,
                                labelText: S.of(context).lbldes,
                                hintText: S.of(context).htdes,
                                labelStyle: TextStyle(
                                  color: Colors.red,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w400,
                                ),
                                hintStyle: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 14.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 2),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.5),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              focusNode: focus1,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (v) {
                                FocusScope.of(context).requestFocus(focus2);
                              },
                              keyboardType: TextInputType.datetime,
                              cursorColor: Theme.of(context).cursorColor,
                              decoration: InputDecoration(
                                prefixText: "DEFAULT",
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
                                labelText: S.of(context).tfexpiration,
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
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18.0,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade200, width: 1.5),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Divider(color: Theme.of(context).dividerColor),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 5,
                                        child: TextField(
                                          focusNode: focus2,
                                          textInputAction: TextInputAction.done,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            prefixStyle: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            contentPadding: EdgeInsets.all(0.0),
                                            labelText: S.of(context).tfamount,
                                            labelStyle: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            hintStyle: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 14.0,
                                            ),
                                            prefixIcon: Icon(
                                              Iconsax.box_time,
                                              color: Colors.red,
                                              size: 18,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade200,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            floatingLabelStyle: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 18.0,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade200,
                                                  width: 1.5),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 4,
                                        child: TextField(
                                          enableInteractiveSelection: true,
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            alignLabelWithHint: true,
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            prefixStyle: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            contentPadding: EdgeInsets.all(0.0),
                                            labelText: S.of(context).lblunit,
                                            hintText: S.of(context).lblunit,
                                            hintStyle: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            labelStyle: TextStyle(
                                              color: Colors.red,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            prefixIcon: Icon(
                                              Iconsax.box_time,
                                              color: Colors.red,
                                              size: 18,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red, width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red,
                                                  width: 1.5),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ))
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
    String scanResult = "";
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
    } on PlatformException {
      scanResult = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() => this.barcode = barcode);
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
