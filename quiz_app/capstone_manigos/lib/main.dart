import 'package:flutter/material.dart';

import 'data/schedule_data.dart';
import 'screens/root_screen.dart';
import 'services/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set up notifications and schedule a reminder 10 min before each class.
  try {
    await NotificationService.instance.init();
    await NotificationService.instance.scheduleAll(ScheduleData.sessions);
  } catch (e) {
    debugPrint('Notification setup failed: $e');
  }

  runApp(const TimetableApp());
}

class TimetableApp extends StatelessWidget {
  const TimetableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class Timetable',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const RootScreen(),
    );
  }
}
