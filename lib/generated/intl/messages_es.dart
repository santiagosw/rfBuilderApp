// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(name) => "Bienvenido ${name}";

  static String m1(firstName, lastName) =>
      "Mi nom bre es ${lastName}, ${firstName} ${lastName}";

  static String m2(howMany) =>
      "${Intl.plural(howMany, one: 'Tienes 1 notificación', other: 'Tienes ${howMany} notificaciones')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "btnlogin": MessageLookupByLibrary.simpleMessage("Ingresar"),
        "email": MessageLookupByLibrary.simpleMessage("Correo Electronico"),
        "forgotpassword":
            MessageLookupByLibrary.simpleMessage("¿Olvido su contraseña?"),
        "mcontacts": MessageLookupByLibrary.simpleMessage("Contactos"),
        "mdarkmode": MessageLookupByLibrary.simpleMessage("Modo Oscuro"),
        "mdashboard": MessageLookupByLibrary.simpleMessage("Menu"),
        "modalhclose": MessageLookupByLibrary.simpleMessage("Cerrar"),
        "modalhwelcome":
            MessageLookupByLibrary.simpleMessage("Bienvenido a RFBuilder"),
        "msettings": MessageLookupByLibrary.simpleMessage("Configuraciones"),
        "msignout": MessageLookupByLibrary.simpleMessage("Cerrar Sesión"),
        "mslidem": MessageLookupByLibrary.simpleMessage("Menu Desplegable"),
        "msupport": MessageLookupByLibrary.simpleMessage("Soporte"),
        "mtask": MessageLookupByLibrary.simpleMessage("Tareas"),
        "password": MessageLookupByLibrary.simpleMessage("Contraseña"),
        "suser": MessageLookupByLibrary.simpleMessage("Usuario"),
        "tconsocardis":
            MessageLookupByLibrary.simpleMessage("Despacho Carro Consolidado"),
        "tconsocontrol":
            MessageLookupByLibrary.simpleMessage("Control Consolidado"),
        "textWithPlaceholder": m0,
        "textWithPlaceholders": m1,
        "textWithPlural": m2,
        "tlttask": MessageLookupByLibrary.simpleMessage("Tareas"),
        "tpicking": MessageLookupByLibrary.simpleMessage("Retirar"),
        "treceivinguard":
            MessageLookupByLibrary.simpleMessage("Guardado de Recepción"),
        "treception": MessageLookupByLibrary.simpleMessage("Recepcion"),
        "treplacement": MessageLookupByLibrary.simpleMessage("Reposicion"),
        "tstock": MessageLookupByLibrary.simpleMessage("Inventario"),
        "ttransfer": MessageLookupByLibrary.simpleMessage("Transferencias")
      };
}
