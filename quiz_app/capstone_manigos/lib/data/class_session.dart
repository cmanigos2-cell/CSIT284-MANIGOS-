import 'package:flutter/material.dart';

/// One class meeting that repeats every week.
class ClassSession {
  final int id;
  final String code;
  final String subject;
  final String room;
  final String instructor;

  /// DateTime.monday (1) ... DateTime.sunday (7)
  final int weekday;
  final TimeOfDay start;
  final TimeOfDay end;
  final Color color;

  const ClassSession({
    required this.id,
    required this.code,
    required this.subject,
    required this.room,
    required this.instructor,
    required this.weekday,
    required this.start,
    required this.end,
    required this.color,
  });

  int get startMinutes => start.hour * 60 + start.minute;
  int get endMinutes => end.hour * 60 + end.minute;

  bool isOngoing(DateTime now) {
    if (now.weekday != weekday) return false;
    final m = now.hour * 60 + now.minute;
    return m >= startMinutes && m < endMinutes;
  }

  bool hasEnded(DateTime now) {
    if (now.weekday != weekday) return false;
    return now.hour * 60 + now.minute >= endMinutes;
  }

  static String formatTime(TimeOfDay t) {
    final h = t.hourOfPeriod == 0 ? 12 : t.hourOfPeriod;
    final m = t.minute.toString().padLeft(2, '0');
    final p = t.period == DayPeriod.am ? 'AM' : 'PM';
    return '$h:$m $p';
  }

  String get timeRange => '${formatTime(start)} - ${formatTime(end)}';
}
