import 'package:flutter/material.dart';
import 'package:flutter_connect_agriculture/config/constants/colors.dart';

class HomeListTile extends StatelessWidget {
  const HomeListTile({
    super.key,
    required this.title,
    required this.deadline,
    required this.progress,
    required this.backgroundColor,
    required this.onTap,
    required this.isCompleted,
  });
  final String title;
  final DateTime deadline;
  final int progress;
  final Color backgroundColor;
  final VoidCallback onTap;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    final daysUntilDeadline = deadline.difference(DateTime.now()).inDays;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: tDarkColor,
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Icon(
                  Icons.calendar_month_rounded,
                  color: daysUntilDeadline <= 0 ? Colors.red : Colors.white,
                ),
                const SizedBox(width: 6),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: progress / 100,
                    backgroundColor: Colors.black.withOpacity(0.2),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.yellow,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '$progress%',
                  style: const TextStyle(color: tDarkColor, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
