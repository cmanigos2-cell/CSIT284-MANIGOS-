import 'package:flutter/material.dart';
import '../data/schedule_data.dart';

/// Row of weekday chips (Mon-Sat).
class DaySelector extends StatelessWidget {
  final int selectedWeekday;
  final ValueChanged<int> onSelected;

  const DaySelector({
    super.key,
    required this.selectedWeekday,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: 6,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final weekday = i + 1;
          return ChoiceChip(
            label: Text(ScheduleData.dayShort[i]),
            selected: weekday == selectedWeekday,
            onSelected: (_) => onSelected(weekday),
          );
        },
      ),
    );
  }
}
