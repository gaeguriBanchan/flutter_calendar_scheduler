import 'package:flutter/material.dart';
import 'package:flutter_calendar_scheduler/const/colors.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.content,
    required this.color,
  });

  final int startTime;
  final int endTime;
  final String content;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: primaryColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Time(
                startTime: startTime,
                endTime: endTime,
              ),
              const SizedBox(
                width: 16,
              ),
              _Content(content: content),
              const SizedBox(
                width: 16,
              ),
              _Category(color: color),
            ],
          ),
        ),
      ),
    );
  }
}

class _Time extends StatelessWidget {
  const _Time({
    required this.startTime,
    required this.endTime,
  });

  final int startTime;
  final int endTime;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: primaryColor,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${startTime.toString().padLeft(2, '0')}:00',
          style: textStyle,
        ),
        Text(
          '${endTime.toString().padLeft(2, '0')}:00',
          style: textStyle.copyWith(
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(content),
    );
  }
}

class _Category extends StatelessWidget {
  const _Category({required this.color});

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      width: 16,
      height: 16,
    );
  }
}
