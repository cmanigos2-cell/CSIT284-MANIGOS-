import 'package:flutter/material.dart';
import '../data/class_session.dart';

/// Card showing one class. Pass [now] to show Ongoing / Done state.
class ClassCard extends StatelessWidget {
  final ClassSession session;
  final DateTime? now;

  const ClassCard({super.key, required this.session, this.now});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final ongoing = now != null && session.isOngoing(now!);
    final done = now != null && session.hasEnded(now!);

    return Opacity(
      opacity: done ? 0.55 : 1,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: ongoing ? 3 : 0,
        color: ongoing
            ? session.color.withAlpha(35)
            : scheme.surfaceContainerHighest.withAlpha(110),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(width: 6, color: session.color),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(session.subject,
                                style: text.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w600)),
                          ),
                          if (ongoing)
                            const Chip(
                              label: Text('Ongoing'),
                              visualDensity: VisualDensity.compact,
                            ),
                          if (done)
                            const Icon(Icons.check_circle_outline, size: 20),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(session.code,
                          style: text.labelLarge
                              ?.copyWith(color: session.color)),
                      const SizedBox(height: 8),
                      _InfoRow(Icons.schedule, session.timeRange),
                      _InfoRow(Icons.place_outlined, session.room),
                      _InfoRow(Icons.person_outline, session.instructor),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoRow(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Row(
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 6),
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
