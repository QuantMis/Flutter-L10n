import 'package:flutter/cupertino.dart';

class L10nProvider extends ChangeNotifier {
  String? local;
  updateLocal(String? lang) {
    local = lang;
    notifyListeners();
  }
}
