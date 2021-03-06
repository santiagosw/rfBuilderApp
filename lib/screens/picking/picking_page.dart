import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:rfbuilder_app/generated/l10n.dart';
import 'package:rfbuilder_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class PickingPage extends StatefulWidget {
  const PickingPage({Key? key}) : super(key: key);

  @override
  _PickingPageState createState() => _PickingPageState();
}

class _PickingPageState extends State<PickingPage> {
  late ScrollController _scrollController;
  bool _isScrolled = false;
  String? dropdown;
  String barcode = '';

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

    List<dynamic> _services = [
      [
        S.of(context).lblcloseconta,
        Iconsax.close_circle,
        Colors.white,
      ],
      [S.of(context).lblendprod, Iconsax.tick_circle, Colors.white],
      [S.of(context).lblnxtprod, Iconsax.next, Colors.white],
      [S.of(context).lblcrtcontent, Iconsax.dcube, Colors.white],
      [S.of(context).lblposition, Iconsax.location, Colors.white],
      [S.of(context).lblprintreq, Iconsax.document, Colors.white],
      [S.of(context).lblprint, Iconsax.printer, Colors.white],
    ];

    final List<dynamic> _productes = [
      [S.of(context).lblpackages, Iconsax.box, '0'],
      [S.of(context).lbldisplay, Iconsax.screenmirroring, '0'],
      [S.of(context).lblunits, Iconsax.element_plus, '0'],
    ];

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
          bottomSheet: Visibility(
            visible: true,
            child: GFBottomSheet(
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
                decoration: BoxDecoration(color: Colors.red, boxShadow: [
                  BoxShadow(color: Colors.black45, blurRadius: 0)
                ]),
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
                      S.of(context).tltpicking,
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
                              S.of(context).tltpicking,
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
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 5,
                                    child: TextField(
                                      enableInteractiveSelection: true,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        alignLabelWithHint: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        prefixStyle: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: S.of(context).tfposition,
                                        hintText: S.of(context).tfposition,
                                        hintStyle: TextStyle(
                                          color: Theme.of(context).primaryColor,
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
                                              color: Colors.red, width: 1.5),
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
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: S.of(context).tfamount,
                                        hintText: S.of(context).tfamount,
                                        hintStyle: TextStyle(
                                          color: Theme.of(context).primaryColor,
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
                                              color: Colors.red, width: 1.5),
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
                        SizedBox(height: 10),
                        Divider(
                          color: Theme.of(context).dividerColor,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (v) {
                            FocusScope.of(context).requestFocus(focus);
                          },
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
                            labelText: S.of(context).tfpickingpos,
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
                        TextField(
                          enableInteractiveSelection: false,
                          readOnly: true,
                          cursorColor: Theme.of(context).cursorColor,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.all(0.0),
                            labelText: S.of(context).tfproduct,
                            hintText: S.of(context).tfproduct,
                            labelStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 17.0,
                              fontWeight: FontWeight.w400,
                            ),
                            hintStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14.0,
                            ),
                            prefixIcon: Icon(
                              Iconsax.box,
                              color: Colors.red,
                              size: 18,
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
                          focusNode: focus,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (v) {
                            FocusScope.of(context).requestFocus(focus1);
                          },
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
                            labelText: S.of(context).tfprodcod,
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
                              Iconsax.archive,
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
                                    child: TextFormField(
                                      focusNode: focus1,
                                      textInputAction: TextInputAction.done,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        prefixStyle: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: S.of(context).tfamount,
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
                                              color: Colors.grey.shade200,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        floatingLabelStyle: TextStyle(
                                          color: Theme.of(context).primaryColor,
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
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        contentPadding: EdgeInsets.all(0.0),
                                        labelText: S.of(context).lblunit,
                                        hintText: S.of(context).lblunit,
                                        hintStyle: TextStyle(
                                          color: Theme.of(context).primaryColor,
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
                                              color: Colors.red, width: 1.5),
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
                        SizedBox(height: 10),
                        Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).cardColor,
                            ),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _productes.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Theme.of(context).cardColor),
                                        margin: EdgeInsets.only(right: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(_productes[index][1],
                                                color: Colors.red),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              _productes[index][0],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "${_productes[index][2]}",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            )
                                          ],
                                        )));
                              },
                            )),
                        SizedBox(height: 10),
                        Text(
                          S.of(context).lblavance,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColor),
                        ),
                        Center(
                            child: FAProgressBar(
                          progressColor: Colors.red,
                          maxValue: 14,
                          currentValue: 10,
                          displayText: "/14",
                          displayTextStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColor),
                          changeProgressColor: Colors.red.shade600,
                          direction: Axis.horizontal,
                          backgroundColor: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(15),
                        )),
                        SizedBox(height: 10)
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
          title: Text('Picking Task'),
          content: Text(
            'Picking Task Info',
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
