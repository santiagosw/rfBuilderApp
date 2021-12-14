import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:rfbuilder_app/generated/l10n.dart';
import 'settings_page/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  bool _isScrolled = false;
  Widget? alertWidget;
  bool showblur = false;
  int pickingNum = 131227;
  int cantProd = 14;
  String codConso = 'FC040';
  int numConso = 84665;
  int bu = 84665;
  int di = 84665;
  int un = 84665;
  String obsasig = '';
  String obsconso = '';

  List<dynamic> _services = [
    [
      'Dashboard',
      Iconsax.home,
      Colors.white,
    ],
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
              expandedHeight: 250.0,
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
                  onPressed: () => showAlertDialoghelp(context),
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
                      S.of(context).tlttask,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              S.of(context).tlttask,
                              style: TextStyle(
                                fontSize: 28,
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
                      Row(children: [
                        SizedBox(width: 10),
                        Container(
                          width: 30,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ]),
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
                  children: [
                    FadeInDown(
                      duration: Duration(milliseconds: 500),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GFButton(
                              onPressed: () {
                                Get.toNamed('/transfers');
                              },
                              text: S.of(context).ttransfer,
                              icon: Icon(Iconsax.arrow_2, color: Colors.red),
                              textColor: Theme.of(context).primaryColor,
                              type: GFButtonType.transparent,
                              position: GFPosition.start,
                            ),
                            Divider(),
                            GFButton(
                              onPressed: () {
                                Get.toNamed('/reception');
                              },
                              text: S.of(context).treception,
                              icon: Icon(Iconsax.box_add, color: Colors.red),
                              textColor: Theme.of(context).primaryColor,
                              type: GFButtonType.transparent,
                              position: GFPosition.start,
                            ),
                            Divider(),
                            Tooltip(
                                message:
                                    "Picking Nro: $pickingNum. \nAsignacion de Productos: \nCant. Prod: $cantProd. \nCod Conso: $codConso. \nNum Conso: $numConso. \nGrupo: \nBU: $bu. \nDI: $di. \nUN: $un. \nObs.Asig: $obsasig. \nObs.Conso: $obsconso.",
                                verticalOffset: 20,
                                waitDuration: Duration(seconds: 1),
                                padding: EdgeInsets.all(10),
                                showDuration: Duration(seconds: 3),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      onPressed: () {
                                        Get.toNamed('/containernum');
                                      },
                                      text: S.of(context).tpicking,
                                      icon: Icon(Iconsax.box_search,
                                          color: Colors.red),
                                      textColor: Theme.of(context).primaryColor,
                                      type: GFButtonType.transparent,
                                      position: GFPosition.start,
                                    ),
                                    GFIconButton(
                                      icon: Icon(Iconsax.info_circle,
                                          color: Colors.red),
                                      type: GFButtonType.transparent,
                                      onPressed: () => showAlertDialog(context),
                                    )
                                  ],
                                )),
                            Divider(),
                            GFButton(
                              onPressed: () {
                                Get.toNamed('/stock');
                              },
                              text: S.of(context).tstock,
                              icon: Icon(Iconsax.document, color: Colors.red),
                              textColor: Theme.of(context).primaryColor,
                              type: GFButtonType.transparent,
                              position: GFPosition.start,
                            ),
                            Divider(),
                            GFButton(
                              onPressed: () {
                                Get.toNamed('/replacement');
                              },
                              text: S.of(context).treplacement,
                              icon: Icon(Iconsax.box_tick, color: Colors.red),
                              textColor: Theme.of(context).primaryColor,
                              type: GFButtonType.transparent,
                              position: GFPosition.start,
                            ),
                            Divider(),
                            GFButton(
                              onPressed: () {
                                Get.toNamed('/savereception');
                              },
                              text: S.of(context).treceivinguard,
                              icon: Icon(Iconsax.save_2, color: Colors.red),
                              textColor: Theme.of(context).primaryColor,
                              type: GFButtonType.transparent,
                              position: GFPosition.start,
                            ),
                            Divider(),
                            GFButton(
                              onPressed: () {},
                              text: S.of(context).tconsocontrol,
                              icon: Icon(Iconsax.security, color: Colors.red),
                              textColor: Theme.of(context).primaryColor,
                              type: GFButtonType.transparent,
                              position: GFPosition.start,
                            ),
                            Divider(),
                            GFButton(
                              onPressed: () {},
                              text: S.of(context).tconsocardis,
                              icon: Icon(Iconsax.box, color: Colors.red),
                              textColor: Theme.of(context).primaryColor,
                              type: GFButtonType.transparent,
                              position: GFPosition.start,
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

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  void showAlertDialog(BuildContext context) => showDialog(
        builder: (context) => AlertDialog(
          title: Text('Picking Info'),
          content: Text(
            "Picking Nro: $pickingNum. \nAsignacion de Productos: \nCant. Prod: $cantProd. \nCod Conso: $codConso. \nNum Conso: $numConso. \nGrupo: \nBU: $bu. \nDI: $di. \nUN: $un. \nObs.Asig: $obsasig. \nObs.Conso: $obsconso.",
          ),
          actions: [
            OutlineButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                S.of(context).modalhclose,
              ),
              color: Colors.red,
            )
          ],
        ),
        context: context,
      );

  void showAlertDialoghelp(BuildContext context) => showDialog(
        builder: (context) => AlertDialog(
          title: Text(S.of(context).modalhwelcome),
          content: Text('Listado de tareas disponibles segun tus permisos'),
          actions: [
            OutlineButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                S.of(context).modalhclose,
              ),
              color: Colors.red,
            )
          ],
        ),
        context: context,
      );
}
