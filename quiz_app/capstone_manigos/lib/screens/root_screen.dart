import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'weekly_screen.dart';

/// Bottom navigation between Today and Week.
class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _index = 0;

  static const _pages = [HomeScreen(), WeeklyScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.today), label: 'Today'),
          NavigationDestination(
              icon: Icon(Icons.calendar_view_week), label: 'Week'),
        ],
      ),
    );
  }
}
