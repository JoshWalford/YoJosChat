import 'package:flutter/material.dart';

class MyDateUtil {
  static String geFormattedTime({
    required BuildContext context,
    required int time,
  }) {
    final date = DateTime.fromMillisecondsSinceEpoch(time);
    return TimeOfDay.fromDateTime(date).format(context);
  }
}
