// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Paswword`
  String get password {
    return Intl.message(
      'Paswword',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotpassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotpassword',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get suser {
    return Intl.message(
      'User',
      name: 'suser',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get mdashboard {
    return Intl.message(
      'Dashboard',
      name: 'mdashboard',
      desc: '',
      args: [],
    );
  }

  /// `Tasks`
  String get mtask {
    return Intl.message(
      'Tasks',
      name: 'mtask',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get mcontacts {
    return Intl.message(
      'Contacts',
      name: 'mcontacts',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get msettings {
    return Intl.message(
      'Settings',
      name: 'msettings',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get msupport {
    return Intl.message(
      'Support',
      name: 'msupport',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get mdarkmode {
    return Intl.message(
      'Dark Mode',
      name: 'mdarkmode',
      desc: '',
      args: [],
    );
  }

  /// `Slide Menu`
  String get mslidem {
    return Intl.message(
      'Slide Menu',
      name: 'mslidem',
      desc: '',
      args: [],
    );
  }

  /// `SignOut`
  String get msignout {
    return Intl.message(
      'SignOut',
      name: 'msignout',
      desc: '',
      args: [],
    );
  }

  /// `Transfers`
  String get ttransfer {
    return Intl.message(
      'Transfers',
      name: 'ttransfer',
      desc: '',
      args: [],
    );
  }

  /// `Reception`
  String get treception {
    return Intl.message(
      'Reception',
      name: 'treception',
      desc: '',
      args: [],
    );
  }

  /// `Picking`
  String get tpicking {
    return Intl.message(
      'Picking',
      name: 'tpicking',
      desc: '',
      args: [],
    );
  }

  /// `Stock`
  String get tstock {
    return Intl.message(
      'Stock',
      name: 'tstock',
      desc: '',
      args: [],
    );
  }

  /// `Replacement`
  String get treplacement {
    return Intl.message(
      'Replacement',
      name: 'treplacement',
      desc: '',
      args: [],
    );
  }

  /// `Receiving Guard`
  String get treceivinguard {
    return Intl.message(
      'Receiving Guard',
      name: 'treceivinguard',
      desc: '',
      args: [],
    );
  }

  /// `Consolidated Control`
  String get tconsocontrol {
    return Intl.message(
      'Consolidated Control',
      name: 'tconsocontrol',
      desc: '',
      args: [],
    );
  }

  /// `Consolidated Car Dispatch`
  String get tconsocardis {
    return Intl.message(
      'Consolidated Car Dispatch',
      name: 'tconsocardis',
      desc: '',
      args: [],
    );
  }

  /// `Tasks`
  String get tlttask {
    return Intl.message(
      'Tasks',
      name: 'tlttask',
      desc: '',
      args: [],
    );
  }

  /// `Reception`
  String get tltreception {
    return Intl.message(
      'Reception',
      name: 'tltreception',
      desc: '',
      args: [],
    );
  }

  /// `Picking`
  String get tltpicking {
    return Intl.message(
      'Picking',
      name: 'tltpicking',
      desc: '',
      args: [],
    );
  }

  /// `Stock`
  String get tltstock {
    return Intl.message(
      'Stock',
      name: 'tltstock',
      desc: '',
      args: [],
    );
  }

  /// `Replacement`
  String get tltreplacement {
    return Intl.message(
      'Replacement',
      name: 'tltreplacement',
      desc: '',
      args: [],
    );
  }

  /// `Save Reception`
  String get tltreceivinguard {
    return Intl.message(
      'Save Reception',
      name: 'tltreceivinguard',
      desc: '',
      args: [],
    );
  }

  /// `Position`
  String get tfposition {
    return Intl.message(
      'Position',
      name: 'tfposition',
      desc: '',
      args: [],
    );
  }

  /// `Product`
  String get tfproduct {
    return Intl.message(
      'Product',
      name: 'tfproduct',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get tfdescription {
    return Intl.message(
      'Description',
      name: 'tfdescription',
      desc: '',
      args: [],
    );
  }

  /// `Expiration`
  String get tfexpiration {
    return Intl.message(
      'Expiration',
      name: 'tfexpiration',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get tfamount {
    return Intl.message(
      'Amount',
      name: 'tfamount',
      desc: '',
      args: [],
    );
  }

  /// `Position Picking`
  String get tfpickingpos {
    return Intl.message(
      'Position Picking',
      name: 'tfpickingpos',
      desc: '',
      args: [],
    );
  }

  /// `Product Code`
  String get tfprodcod {
    return Intl.message(
      'Product Code',
      name: 'tfprodcod',
      desc: '',
      args: [],
    );
  }

  /// `Enter Position`
  String get tfenterpos {
    return Intl.message(
      'Enter Position',
      name: 'tfenterpos',
      desc: '',
      args: [],
    );
  }

  /// `Enter Item`
  String get tfenteritem {
    return Intl.message(
      'Enter Item',
      name: 'tfenteritem',
      desc: '',
      args: [],
    );
  }

  /// `Origin`
  String get tforigin {
    return Intl.message(
      'Origin',
      name: 'tforigin',
      desc: '',
      args: [],
    );
  }

  /// `Destination`
  String get tfdestination {
    return Intl.message(
      'Destination',
      name: 'tfdestination',
      desc: '',
      args: [],
    );
  }

  /// `Car Number`
  String get tfcarnum {
    return Intl.message(
      'Car Number',
      name: 'tfcarnum',
      desc: '',
      args: [],
    );
  }

  /// `Reason`
  String get tfreason {
    return Intl.message(
      'Reason',
      name: 'tfreason',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to RFBuilder`
  String get modalhwelcome {
    return Intl.message(
      'Welcome to RFBuilder',
      name: 'modalhwelcome',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get modalhclose {
    return Intl.message(
      'Close',
      name: 'modalhclose',
      desc: '',
      args: [],
    );
  }

  /// `Container`
  String get modalcontainer {
    return Intl.message(
      'Container',
      name: 'modalcontainer',
      desc: '',
      args: [],
    );
  }

  /// `Please enter te digitcode of container picking`
  String get modalcontainerdes {
    return Intl.message(
      'Please enter te digitcode of container picking',
      name: 'modalcontainerdes',
      desc: '',
      args: [],
    );
  }

  /// `type here a description`
  String get htdes {
    return Intl.message(
      'type here a description',
      name: 'htdes',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get btnlogin {
    return Intl.message(
      'Login',
      name: 'btnlogin',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get btncontinue {
    return Intl.message(
      'Continue',
      name: 'btncontinue',
      desc: '',
      args: [],
    );
  }

  /// `Packages`
  String get lblpackages {
    return Intl.message(
      'Packages',
      name: 'lblpackages',
      desc: '',
      args: [],
    );
  }

  /// `Display`
  String get lbldisplay {
    return Intl.message(
      'Display',
      name: 'lbldisplay',
      desc: '',
      args: [],
    );
  }

  /// `Units`
  String get lblunits {
    return Intl.message(
      'Units',
      name: 'lblunits',
      desc: '',
      args: [],
    );
  }

  /// `Picking`
  String get lblpicking {
    return Intl.message(
      'Picking',
      name: 'lblpicking',
      desc: '',
      args: [],
    );
  }

  /// `Warehouse`
  String get lblwarehouse {
    return Intl.message(
      'Warehouse',
      name: 'lblwarehouse',
      desc: '',
      args: [],
    );
  }

  /// `Product`
  String get lblproduct {
    return Intl.message(
      'Product',
      name: 'lblproduct',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get lblamount {
    return Intl.message(
      'Amount',
      name: 'lblamount',
      desc: '',
      args: [],
    );
  }

  /// `Unit`
  String get lblunit {
    return Intl.message(
      'Unit',
      name: 'lblunit',
      desc: '',
      args: [],
    );
  }

  /// `Expiration`
  String get lblexpiration {
    return Intl.message(
      'Expiration',
      name: 'lblexpiration',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get lbldes {
    return Intl.message(
      'Description',
      name: 'lbldes',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
