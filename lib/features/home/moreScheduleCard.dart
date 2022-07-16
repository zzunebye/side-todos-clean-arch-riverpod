import 'package:flutter/material.dart';

import '../../style/customTheme.dart';

class MoreScheduleCard extends StatelessWidget {
  const MoreScheduleCard({Key? key, required this.numOfSchedule}) : super(key: key);

  final int numOfSchedule;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(32)),
      elevation: 0,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text("Click to view more", style: Theme.of(context).textTheme.headline6?.copyWith(color: CustomColor.textWhiteColor)),
            const SizedBox(height: 8),
            Text('+$numOfSchedule schedule', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.blueGrey)),
          ],
        ),
      ),
    );
  }
}