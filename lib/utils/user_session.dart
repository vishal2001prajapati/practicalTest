import 'package:shared_preferences/shared_preferences.dart';

class UserSession {
  static const String _emailKey = 'email';

  static Future<void> saveUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_emailKey, email);
  }

  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_emailKey);
  }

  static Future<void> removeUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_emailKey);
  }
}
