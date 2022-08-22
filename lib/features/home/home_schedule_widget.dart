import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../style/custom_theme.dart';

class HomeScheduleWidget extends HookConsumerWidget {
  const HomeScheduleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
        decoration: ShapeDecoration(
          color: CustomColor.primaryColor,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(64.0),
          ),
          shadows: <BoxShadow>[
            BoxShadow(
              blurStyle: BlurStyle.inner,
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 3.0,
              spreadRadius: -20.0,
              offset: const Offset(0.0, 32.0),
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Great, your today's plan almost done", style: Theme.of(context).textTheme.headline6?.copyWith(color: CustomColor.textWhiteColor)),
                  const SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("View Task", style: Theme.of(context).textTheme.button?.copyWith(color: CustomColor.textWhiteColor)),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: CircularPercentIndicator(
                center: Text("60%", style: Theme.of(context).textTheme.subtitle1?.copyWith(color: CustomColor.textWhiteColor)),
                percent: 0.6,
                lineWidth: 10.0,
                radius: 40.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
