import 'dart:async';
import 'package:flutter/material.dart';

import '../data/schedule_data.dart';
import '../widgets/class_card.dart';
import '../widgets/empty_state.dart';

/// "Today's classes" home screen.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _now = DateTime.now();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Refresh every minute so Ongoing / Done states stay current.
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (mounted) setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final today = ScheduleData.forDay(_now.weekday);
    final dayName = ScheduleData.dayNames[_now.weekday - 1];
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Today's Classes")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dayName,
                    style: text.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                Text(
                  today.isEmpty
                      ? 'No classes scheduled'
                      : '${today.length} class${today.length == 1 ? '' : 'es'} today',
                  style: text.bodyLarge,
                ),
              ],
            ),
          ),
          Expanded(
            child: today.isEmpty
                ? const EmptyState(message: 'No classes today. Enjoy your day!')
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                    itemCount: today.length,
                    itemBuilder: (_, i) =>
                        ClassCard(session: today[i], now: _now),
                  ),
          ),
        ],
      ),
    );
  }
}
