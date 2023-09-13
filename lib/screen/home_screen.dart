import 'package:flutter/material.dart';
import 'package:flutter_calendar_scheduler/components/calendar.dart';
import 'package:flutter_calendar_scheduler/components/schedule_card.dart';
import 'package:flutter_calendar_scheduler/components/today_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              selectedDay: selectedDay,
              focusedDay: focusedDay,
              onDaySelected: onDaySelected,
            ),
            const SizedBox(
              height: 8,
            ),
            TodayBanner(
              selectedDay: selectedDay,
              scheduleCount: 3,
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: ScheduleCard(
                startTime: 2,
                endTime: 4,
                content: '코딩',
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }

  onDaySelected(selectedDay, focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }
}
