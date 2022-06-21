class DateTimeUtil {
  DateTimeUtil();

  // 计算年龄
  static int calculatedAge(DateTime birthday) {

    if (birthday.isAfter(DateTime.now())) {
      return DateTime.now().year - birthday.year;
    }

    throw UnsupportedError('birthday should before current time');
  }
}