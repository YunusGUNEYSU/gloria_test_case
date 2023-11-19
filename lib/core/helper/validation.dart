import 'package:flutter/foundation.dart';

@immutable
final class ValidationService {
  const ValidationService._();
  static String? emailValidation(String val) {
    if (val.toLowerCase().isEmpty) {
      return 'Enter your email';
    }
    bool isEmail = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val);
    if (!isEmail) {
      return 'Please enter correct email';
    }
    return null;
  }

  static String? nameValidation(String val) {
    if (val.toLowerCase().isEmpty) {
      return 'Enter your hotel name';
    }
    if (val.toLowerCase().length < 3) {
      return 'Hotel name should be not be less than 3 characters';
    }
    return null;
  }

  static String? passwordValidation(String val) {
    if (val.toLowerCase().isEmpty) {
      return 'Enter your password';
    }
    if (val.length < 6) {
      return 'Password length should not be less than 6 characters ';
    }
    return null;
  }
}
