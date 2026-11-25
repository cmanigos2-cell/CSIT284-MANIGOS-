import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import '../data/class_session.dart';

/// Schedules a weekly notification 10 minutes before every class.
class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  static const int reminderMinutes = 10;
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    tzdata.initializeTimeZones();
    try {
      final name = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(name));
    } catch (_) {
      tz.setLocalLocation(tz.getLocation('Asia/Manila'));
    }

    const settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await _plugin.initialize(settings);

    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await android?.requestNotificationsPermission();
    await android?.requestExactAlarmsPermission();
  }

  Future<void> scheduleAll(List<ClassSession> sessions) async {
    await _plugin.cancelAll();
    for (final s in sessions) {
      await _scheduleWeekly(s);
    }
  }

  Future<void> _scheduleWeekly(ClassSession s) async {
    final when = _nextReminderTime(s);

    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'class_reminders',
        'Class reminders',
        channelDescription: 'Reminder 10 minutes before each class',
        importance: Importance.high,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );

    final title = '${s.code} starts in $reminderMinutes minutes';
    final body =
        '${s.subject} • ${s.room} • ${ClassSession.formatTime(s.start)}';

    Future<void> schedule(AndroidScheduleMode mode) => _plugin.zonedSchedule(
          s.id,
          title,
          body,
          when,
          details,
          androidScheduleMode: mode,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
        );

    try {
      await schedule(AndroidScheduleMode.exactAllowWhileIdle);
    } catch (_) {
      // Exact alarm permission denied -> fall back to inexact.
      await schedule(AndroidScheduleMode.inexactAllowWhileIdle);
    }
  }

  /// Next occurrence of (class start - 10 min), in local time.
  tz.TZDateTime _nextReminderTime(ClassSession s) {
    final now = tz.TZDateTime.now(tz.local);
    var date = tz.TZDateTime(
        tz.local, now.year, now.month, now.day, s.start.hour, s.start.minute);
    while (date.weekday != s.weekday) {
      date = date.add(const Duration(days: 1));
    }
    date = date.subtract(const Duration(minutes: reminderMinutes));
    if (date.isBefore(now)) {
      date = date.add(const Duration(days: 7));
    }
    return date;
  }
}
