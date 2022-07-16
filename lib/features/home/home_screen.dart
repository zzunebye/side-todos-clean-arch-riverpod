import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todos_clean_arch_riverpod/core/providers.dart';
import 'package:todos_clean_arch_riverpod/features/setting/SettingPage.dart';
import 'package:todos_clean_arch_riverpod/features/calender/calender_page.dart';
import 'package:todos_clean_arch_riverpod/features/chat/chat_page.dart';
import 'package:todos_clean_arch_riverpod/features/feed/feed_page.dart';

import '../../core/custom_nav_bar.dart';
import 'moreScheduleCard.dart';
import 'scheduleCard.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key, required this.title, this.tab = 'feed'}) : super(key: key);

  final String title;
  final String tab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(navTabIndexProvider);

    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      body: SafeArea(
        child: IndexedStack(
          index: tabIndex,
          children: const [
            FeedPage(),
            CalenderPage(),
            ChatPage(),
            SettingPage(),
          ],
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

//Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//           child: Column(
//             children: [
//               buildTopBar(context),
//               const SizedBox(height: 24),
//               const HomeScheduleWidget(),
//               const SizedBox(height: 24),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Today's Schedule",
//                   style: Theme.of(context).textTheme.headline5?.copyWith(),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               buildScheduleCardList(context),
//               const SizedBox(height: 16),
//               // const BottomNavigationBar(items: items)TabBar(tabs: [
//               //   Tab(text: "Hi",)
//               // ],)
//             ],
//           ),
//         ),
