import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  bool _isScrolled = false;

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

  @override
  Widget build(BuildContext context) {
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
            textColor: Colors.white,
            iconColor: Colors.white,
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
                    child: Image.network('https://i.imgur.com/9qbgwba.png')),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    "Usuario",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
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
                  leading: Icon(Iconsax.home),
                  title: Text('Dashboard'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Iconsax.task),
                  title: Text('Tasks'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Iconsax.profile_2user),
                  title: Text('Contacts'),
                ),
                Divider(color: Colors.grey.shade800),
                ListTile(
                  onTap: () {},
                  leading: Icon(Iconsax.setting_2),
                  title: Text('Settings'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Iconsax.menu),
                  title: Text('Slide Menu'),
                  trailing: Icon(Iconsax.arrow_circle_up),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Iconsax.support),
                  title: Text('Support'),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Version 1.0.0',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: CustomScrollView(controller: _scrollController, slivers: [
            SliverAppBar(
              expandedHeight: 250.0,
              elevation: 0,
              pinned: true,
              stretch: true,
              toolbarHeight: 80,
              backgroundColor: Colors.white,
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
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Iconsax.more, color: Colors.red),
                  onPressed: () {},
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
                      '\Tasks',
                      style: TextStyle(
                        color: Colors.black,
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
                              'Tasks',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
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
                        GFButton(
                          onPressed: () {},
                          text: "Transferencias",
                          icon: Icon(Iconsax.arrow_2),
                          textColor: Colors.black,
                          type: GFButtonType.transparent,
                          position: GFPosition.end,
                          fullWidthButton: true,
                        ),
                        Divider(),
                        GFButton(
                          onPressed: () {
                            Get.toNamed('/reception');
                          },
                          text: "Recepción",
                          icon: Icon(Iconsax.box_add),
                          textColor: Colors.black,
                          type: GFButtonType.transparent,
                          fullWidthButton: true,
                          position: GFPosition.end,
                        ),
                        Divider(),
                        GFButton(
                          onPressed: () {
                            Get.toNamed('/savereception');
                          },
                          text: "Guardado de Recepción",
                          icon: Icon(Iconsax.save_2),
                          textColor: Colors.black,
                          type: GFButtonType.transparent,
                          fullWidthButton: true,
                          position: GFPosition.end,
                        ),
                        Divider(),
                        GFButton(
                          onPressed: () {},
                          text: "Control Consolidado",
                          icon: Icon(Iconsax.security),
                          textColor: Colors.black,
                          type: GFButtonType.transparent,
                          fullWidthButton: true,
                          position: GFPosition.end,
                        ),
                        Divider(),
                        GFButton(
                          onPressed: () {},
                          text: "Despacho de carro consolidado",
                          icon: Icon(Iconsax.box),
                          textColor: Colors.black,
                          type: GFButtonType.transparent,
                          fullWidthButton: true,
                          position: GFPosition.end,
                        ),
                        Divider(),
                        GFButton(
                          onPressed: () {},
                          text: "Ayudante Gondola",
                          icon: Icon(Iconsax.personalcard),
                          textColor: Colors.black,
                          type: GFButtonType.transparent,
                          fullWidthButton: true,
                          position: GFPosition.end,
                        ),
                        GFAccordion(
                          title: 'Informacion',
                          content:
                              'Aqui se mostraran los cambios importantes de la aplicacion y informacion de las tareas durante la navegacion',
                          collapsedIcon: Text('Mostrar'),
                          expandedIcon: Text('Ocultar'),
                          collapsedTitleBackgroundColor: Colors.grey.shade100,
                          contentBackgroundColor: Colors.grey.shade300,
                          titleBorder: Border.all(width: 1),
                          contentBorder: Border.all(width: 0.5),
                          titleBorderRadius: BorderRadius.circular(5),
                          contentBorderRadius: BorderRadius.circular(5),
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
}
