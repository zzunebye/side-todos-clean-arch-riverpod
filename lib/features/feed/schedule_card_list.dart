import 'package:flutter/material.dart';

import '../home/moreScheduleCard.dart';
import '../home/scheduleCard.dart';

class ScheduleCardList extends StatelessWidget {
  const ScheduleCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: const [
              ScheduleCard(title: "Meeting with developer", start: '07:00', end: '08:00'),
              SizedBox(height: 8),
              ScheduleCard(
                title: "Meeting with developer",
                start: '07:00',
                end: '08:00',
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            children: const [
              ScheduleCard(title: "Meeting with developer", start: '07:00', end: '08:00'),
              SizedBox(height: 8),
              MoreScheduleCard(
                numOfSchedule: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
