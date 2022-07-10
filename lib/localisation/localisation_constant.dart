import 'package:flutter/material.dart';
import 'demo_localisation.dart';

String getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context).translate(key);
}
