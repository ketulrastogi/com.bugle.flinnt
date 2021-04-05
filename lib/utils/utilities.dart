import 'dart:convert';

import 'package:crypto/crypto.dart';

String convertPasswordToMD5(String value) {
  return md5.convert(utf8.encode(value)).toString();
}

bool isNumber(String value){
  RegExp _numeric = RegExp(r'^-?[0-9]+$');
  return _numeric.hasMatch(value);
}