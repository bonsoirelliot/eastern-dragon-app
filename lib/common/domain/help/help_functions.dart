class HelpFunctions {
  /// Используется для изменения слова при изменении количества
  ///
  /// Например: 1 - "год", 2 - "года", 10 - "лет"
  static String wordByCount(int count, List<String> words) {
    final countStr = '0${count.toString()}';

    var prefix = words[0];

    if (RegExp(r'^([\d]*[02-9])?1$').firstMatch(countStr) != null) {
      prefix = words[1];
    } else if (RegExp(r'^[\d]*[02-9][2-4]$').firstMatch(countStr) != null) {
      prefix = words[2];
    }

    return prefix;
  }
}
