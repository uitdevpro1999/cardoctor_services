import 'dart:convert';

class Consts {
  static String packageName = 'cardoctor_services';
  static const String BASIC_USERNAME = "CarDoctor";
  static const String BASIC_PASSWORD = "2qazXSW@3edcVFR\$5tgbNHY^7ujm<KI*9ol.?:P):))";
  static String BASIC_AUTH = 'BASIC ${base64Encode(utf8.encode('$BASIC_USERNAME:$BASIC_PASSWORD'))}';
}