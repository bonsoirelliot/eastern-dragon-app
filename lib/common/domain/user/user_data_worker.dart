import 'package:shared_preferences/shared_preferences.dart';

abstract class UserDataWorker {
  /// Чтение данных пользователя с устройства
  static Future<bool?> readUserAuthState() async {
    final prefs = await SharedPreferences.getInstance();
    final rawUserAuthState = prefs.getBool('isAuth');

    if (rawUserAuthState == null) return null;

    return rawUserAuthState;
  }

  /// Запись данных пользователя на устройство
  static Future<void> writeUserAuthState(bool state) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isAuth', state);
  }
}
