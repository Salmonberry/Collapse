import 'package:date_format/date_format.dart';

/// 相关资料：
/// https://pub.dev/packages/date_time_format
/// https://pub.dev/packages/date_format/install
/// https://api.flutter.dev/flutter/intl/DateFormat-class.html
/// https://github.com/dayjs/day.dart/blob/master/API.md
class DateTimeUtil {
  DateTimeUtil();

  // 计算年龄
  static int calculatedAge(DateTime birthday) {
    if (birthday.isAfter(DateTime.now())) {
      return DateTime.now().year - birthday.year;
    }
    throw UnsupportedError('birthday should before current time');
  }

// 时间区间，如：早上/中午/下午/晚上
  static String getWholeDayTimeZoneString(DateTime dateTime) {
    final int hour = dateTime.hour;
    String timeZoneString = '';
    if (hour >= 0 && hour < 11) {
      timeZoneString = 'morning';
    } else if (hour >= 11 && hour < 13) {
      timeZoneString = 'noon';
    } else if (hour >= 13 && hour < 18) {
      timeZoneString = 'afternoon';
    } else if (hour >= 18 && hour < 24) {
      timeZoneString = 'evening';
    }
    return timeZoneString;
  }

  /// 格式化時間，如：12:30
  static String getTime(DateTime dateTime) =>
      formatDate(dateTime, [hh, ':', nn]);


}
