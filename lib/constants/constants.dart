import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const EMAIL_REGEX =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

// ignore: constant_identifier_names
const PASSWORD_REGEX =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

// ignore: constant_identifier_names
const CALANDER_REGEX =
    r'^(0?[1-9]|[12][0-9]|3[01])[\/.\-](0?[1-9]|1[012])[\/.\-]\d{4}$';

// ignore: constant_identifier_names
const OTP_REGEX = r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/';

// ignore: constant_identifier_names
const String ENGLISH = 'en';
// ignore: constant_identifier_names
const String HINDI = 'hi';
// ignore: constant_identifier_names
const String CHINESE = 'zh';
// ignore: constant_identifier_names
const String SPANISH = 'es';
// ignore: constant_identifier_names
const String ARABIC = 'ar';
// ignore: constant_identifier_names
const String RUSSIAN = 'ru';
// ignore: constant_identifier_names
const String JAPANESE = 'ja';
// ignore: constant_identifier_names
const String DEUTSCH = 'de';

// ignore: constant_identifier_names
const String LAGUAGE_CODE = 'languageCode';

// ignore: constant_identifier_names
const String SETTINGS = 'settings';
// ignore: constant_identifier_names
const int FINGERPRINTTIMEOUT = 60000;

String sortdescriptionvalidate(String value, BuildContext context) {
  if (value.isEmpty) {
    return "Sort Description is required";
  }
  if (value.length < 3) {
    return "minimam 5 character is required ";
  }
  return null;
}

const LinearGradient gradient = LinearGradient(colors: <Color>[
  Colors.red,
  Colors.orange,
  Colors.yellow,
]);
