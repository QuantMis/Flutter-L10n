import 'package:flutter/material.dart';
import 'package:localization_test/core/shared_preferences/shared_preferences.dart';
import 'package:localization_test/src/app.dart';

void main() async {
  await _init();
  runApp(const App());
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.getLang();
}
