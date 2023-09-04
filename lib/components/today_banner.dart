import 'package:flutter/material.dart';
import 'package:flutter_calendar_scheduler/const/colors.dart';

class TodayBanner extends StatelessWidget {
  const TodayBanner({
    super.key,
    required this.selectedDay,
    required this.scheduleCount,
  });

  final DateTime selectedDay;
  final int scheduleCount;

  final textStyle = const TextStyle(
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${selectedDay.year}년 ${selectedDay.month}월 ${selectedDay.day}일',
              style: textStyle,
            ),
            Text(
              '$scheduleCount개',
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
