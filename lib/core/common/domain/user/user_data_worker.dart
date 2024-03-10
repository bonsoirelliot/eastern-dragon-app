import 'package:shared_preferences/shared_preferences.dart';

abstract class UserDataWorker {
  /// Чтение данных пользователя с устройства
  static Future<int?> readUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final rawUserAuthState = prefs.getInt('userId');

    if (rawUserAuthState == null) return null;

    return rawUserAuthState;
  }

  /// Запись id пользователя на устройство
  static Future<void> writeUserId(int userId) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt('userId', userId);
  }

  /// Удаление данных
  static Future<void> removeUserId() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('userId');
  }
}
