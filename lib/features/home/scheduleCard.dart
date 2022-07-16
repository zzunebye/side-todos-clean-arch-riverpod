import 'package:flutter/material.dart';

import '../../style/customTheme.dart';



class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key, required this.title, required this.start, required this.end, this.imageLink}) : super(key: key);

  final String title;
  final String start;
  final String end;
  final String? imageLink;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColor.textWhiteColor,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(32)),
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(title, style: Theme.of(context).textTheme.headline6?.copyWith(color: CustomColor.primaryColor)),
            const SizedBox(height: 8),
            Text('$start - $end', style: Theme.of(context).textTheme.bodyText2),
            (imageLink != null) ? Image.network(imageLink!) : Container(),
          ],
        ),
      ),
    );
  }
}

enum ScheduleCardType {
  Schedule,
  More,
}
