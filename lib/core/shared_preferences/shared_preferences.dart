import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static String? lang;

  static addLang(String lang) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('lang', lang);
  }

  static Future<String?> getLang() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    lang = sp.getString('lang');
    return lang;
  }
}
