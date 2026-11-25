import 'package:flutter/material.dart';

import '../data/schedule_data.dart';
import '../widgets/class_card.dart';
import '../widgets/day_selector.dart';
import '../widgets/empty_state.dart';

/// Weekly timetable: pick a day, see its classes.
class WeeklyScreen extends StatefulWidget {
  const WeeklyScreen({super.key});

  @override
  State<WeeklyScreen> createState() => _WeeklyScreenState();
}

class _WeeklyScreenState extends State<WeeklyScreen> {
  late int _selected;

  @override
  void initState() {
    super.initState();
    final w = DateTime.now().weekday;
    _selected = w > 6 ? 1 : w; // Sunday -> show Monday
  }

  @override
  Widget build(BuildContext context) {
    final classes = ScheduleData.forDay(_selected);

    return Scaffold(
      appBar: AppBar(title: const Text('Weekly Timetable')),
      body: Column(
        children: [
          DaySelector(
            selectedWeekday: _selected,
            onSelected: (d) => setState(() => _selected = d),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ScheduleData.dayNames[_selected - 1],
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Expanded(
            child: classes.isEmpty
                ? const EmptyState(message: 'No classes on this day.')
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                    itemCount: classes.length,
                    itemBuilder: (_, i) => ClassCard(session: classes[i]),
                  ),
          ),
        ],
      ),
    );
  }
}
