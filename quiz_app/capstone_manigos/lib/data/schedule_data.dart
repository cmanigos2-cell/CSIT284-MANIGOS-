import 'package:flutter/material.dart';
import 'class_session.dart';

/// Seed data: a single section's weekly schedule (10 class events).
/// There is no editing UI, so change classes here.
class ScheduleData {
  static const List<String> dayNames = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday',
  ];
  static const List<String> dayShort = [
    'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun',
  ];

  static const List<ClassSession> sessions = [
    // Monday
    ClassSession(
      id: 1, code: 'CS101', subject: 'Intro to Programming',
      room: 'Room 301', instructor: 'Prof. Santos',
      weekday: DateTime.monday,
      start: TimeOfDay(hour: 8, minute: 0), end: TimeOfDay(hour: 9, minute: 30),
      color: Colors.indigo,
    ),
    ClassSession(
      id: 2, code: 'MATH201', subject: 'Discrete Mathematics',
      room: 'Room 204', instructor: 'Dr. Reyes',
      weekday: DateTime.monday,
      start: TimeOfDay(hour: 13, minute: 0), end: TimeOfDay(hour: 14, minute: 30),
      color: Colors.teal,
    ),
    // Tuesday
    ClassSession(
      id: 3, code: 'CS102', subject: 'Data Structures',
      room: 'Lab 2', instructor: 'Prof. Santos',
      weekday: DateTime.tuesday,
      start: TimeOfDay(hour: 9, minute: 0), end: TimeOfDay(hour: 11, minute: 0),
      color: Colors.deepOrange,
    ),
    ClassSession(
      id: 4, code: 'ENG101', subject: 'Technical Writing',
      room: 'Room 110', instructor: 'Ms. Cruz',
      weekday: DateTime.tuesday,
      start: TimeOfDay(hour: 14, minute: 0), end: TimeOfDay(hour: 15, minute: 30),
      color: Colors.purple,
    ),
    // Wednesday
    ClassSession(
      id: 5, code: 'CS101', subject: 'Intro to Programming (Lab)',
      room: 'Lab 1', instructor: 'Prof. Santos',
      weekday: DateTime.wednesday,
      start: TimeOfDay(hour: 8, minute: 0), end: TimeOfDay(hour: 10, minute: 0),
      color: Colors.indigo,
    ),
    ClassSession(
      id: 6, code: 'PE101', subject: 'Physical Education',
      room: 'Gymnasium', instructor: 'Coach Dizon',
      weekday: DateTime.wednesday,
      start: TimeOfDay(hour: 15, minute: 0), end: TimeOfDay(hour: 16, minute: 0),
      color: Colors.green,
    ),
    // Thursday
    ClassSession(
      id: 7, code: 'MATH201', subject: 'Discrete Mathematics',
      room: 'Room 204', instructor: 'Dr. Reyes',
      weekday: DateTime.thursday,
      start: TimeOfDay(hour: 10, minute: 0), end: TimeOfDay(hour: 11, minute: 30),
      color: Colors.teal,
    ),
    ClassSession(
      id: 8, code: 'CS103', subject: 'Database Systems',
      room: 'Room 305', instructor: 'Dr. Lim',
      weekday: DateTime.thursday,
      start: TimeOfDay(hour: 13, minute: 0), end: TimeOfDay(hour: 15, minute: 0),
      color: Colors.blue,
    ),
    // Friday
    ClassSession(
      id: 9, code: 'CS102', subject: 'Data Structures',
      room: 'Room 301', instructor: 'Prof. Santos',
      weekday: DateTime.friday,
      start: TimeOfDay(hour: 9, minute: 0), end: TimeOfDay(hour: 10, minute: 30),
      color: Colors.deepOrange,
    ),
    ClassSession(
      id: 10, code: 'HIST101', subject: 'Philippine History',
      room: 'Room 120', instructor: 'Mr. Garcia',
      weekday: DateTime.friday,
      start: TimeOfDay(hour: 13, minute: 0), end: TimeOfDay(hour: 14, minute: 30),
      color: Colors.brown,
    ),
  ];

  /// Classes for a weekday, sorted by start time.
  static List<ClassSession> forDay(int weekday) {
    final list = sessions.where((s) => s.weekday == weekday).toList()
      ..sort((a, b) => a.startMinutes.compareTo(b.startMinutes));
    return list;
  }
}
