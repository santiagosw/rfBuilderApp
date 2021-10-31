// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(name) => "Welcome ${name}";

  static String m1(firstName, lastName) =>
      "My name is ${lastName}, ${firstName} ${lastName}";

  static String m2(howMany) =>
      "${Intl.plural(howMany, one: 'You have 1 notification', other: 'You have ${howMany} notifications')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "btnlogin": MessageLookupByLibrary.simpleMessage("Login"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "forgotpassword":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "mcontacts": MessageLookupByLibrary.simpleMessage("Contacts"),
        "mdarkmode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
        "mdashboard": MessageLookupByLibrary.simpleMessage("Dashboard"),
        "modalhclose": MessageLookupByLibrary.simpleMessage("Close"),
        "modalhwelcome":
            MessageLookupByLibrary.simpleMessage("Welcome to RFBuilder"),
        "msettings": MessageLookupByLibrary.simpleMessage("Settings"),
        "msignout": MessageLookupByLibrary.simpleMessage("SignOut"),
        "mslidem": MessageLookupByLibrary.simpleMessage("Slide Menu"),
        "msupport": MessageLookupByLibrary.simpleMessage("Support"),
        "mtask": MessageLookupByLibrary.simpleMessage("Tasks"),
        "password": MessageLookupByLibrary.simpleMessage("Paswword"),
        "suser": MessageLookupByLibrary.simpleMessage("User"),
        "tconsocardis":
            MessageLookupByLibrary.simpleMessage("Consolidated Car Dispatch"),
        "tconsocontrol":
            MessageLookupByLibrary.simpleMessage("Consolidated Control"),
        "textWithPlaceholder": m0,
        "textWithPlaceholders": m1,
        "textWithPlural": m2,
        "tlttask": MessageLookupByLibrary.simpleMessage("Tasks"),
        "tpicking": MessageLookupByLibrary.simpleMessage("Picking"),
        "treceivinguard":
            MessageLookupByLibrary.simpleMessage("Receiving Guard"),
        "treception": MessageLookupByLibrary.simpleMessage("Reception"),
        "treplacement": MessageLookupByLibrary.simpleMessage("Replacement"),
        "tstock": MessageLookupByLibrary.simpleMessage("Stock"),
        "ttransfer": MessageLookupByLibrary.simpleMessage("Transfers")
      };
}
