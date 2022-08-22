import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todos_clean_arch_riverpod/features/feed/schedule_card_list.dart';

import '../../helpers/modalHelper.dart';
import '../../style/custom_spacing.dart';
import '../home/home_schedule_widget.dart';
import 'feed_top_bar.dart';

class FeedPage extends HookWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoTitleController = useTextEditingController(text: "");
    final todoDescriptionController = useTextEditingController(text: "");

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ModalHelper.showAddTodoModal(context, todoTitleController, todoDescriptionController);
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
              const FeedTopBar(),
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
              ScheduleCardList(),
              const SizedBox(height: Spacing.medium),
            ],
          ),
        ),
      ),
    );
  }
}
