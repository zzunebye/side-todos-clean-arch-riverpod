import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../shared/custom_text_field.dart';
import '../../style/custom_spacing.dart';
import '../home/home_schedule_widget.dart';
import '../home/moreScheduleCard.dart';
import '../home/scheduleCard.dart';

class FeedPage extends HookWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoTitleController = useTextEditingController(text: "");
    final todoDescriptionController = useTextEditingController(text: "");

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCupertinoModalBottomSheet(
            expand: false,
            backgroundColor: Theme.of(context).colorScheme.surface,
            context: context,
            builder: (context) => StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) => Padding(
                padding: const EdgeInsets.all(Spacing.medium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Add Todo', style: Theme.of(context).textTheme.headlineMedium),
                    Form(
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: todoTitleController,
                            hintText: "Title",
                          ),
                          const SizedBox(height: Spacing.medium),
                          CustomTextField(
                            controller: todoDescriptionController,
                            hintText: "Description",
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const Divider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(onPressed: () {}, child: Text("Add")),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.medium, vertical: Spacing.small),
          child: Column(
            children: [
              buildTopBar(context),
              const SizedBox(height: Spacing.large),
              const HomeScheduleWidget(),
              const SizedBox(height: Spacing.large),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Today's Schedule",
                  style: Theme.of(context).textTheme.headline5?.copyWith(),
                ),
              ),
              const SizedBox(height: Spacing.medium),
              buildScheduleCardList(context),
              const SizedBox(height: Spacing.medium),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildScheduleCardList(BuildContext context) {
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

  Widget buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            Text("Let's become", style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.teal, fontWeight: FontWeight.w500, height: 1)),
            const SizedBox(
              height: 4,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("more ", style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.teal, fontWeight: FontWeight.w500, height: 1)),
                Text("Productive", style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.amber, fontWeight: FontWeight.w500, height: 1)),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.notifications),
          color: Colors.amber,
        ),
      ],
    );
  }
}


