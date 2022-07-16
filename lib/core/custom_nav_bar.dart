import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todos_clean_arch_riverpod/core/providers.dart';

class CustomNavBar extends ConsumerWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(navTabIndexProvider);
    return BottomNavigationBar(
      currentIndex: tabIndex,
      type: BottomNavigationBarType.fixed,
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      unselectedItemColor: Colors.blueGrey,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      onTap: (index) {
        print('ontap ${this.key}');
        ref.read(navTabIndexProvider.notifier).state = index;
        _onItemTapped(index, context);
      },
      items: allDestinations.map((Destination destination) {
        return BottomNavigationBarItem(
          icon: Icon(destination.icon),
          label: destination.title,
        );
      }).toList(),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home/feed');
        break;
      case 1:
        GoRouter.of(context).go('/home/calender');
        break;
      case 2:
        GoRouter.of(context).go('/home/chat');
        break;
      case 3:
        GoRouter.of(context).go('/home/setting');
        break;
    }
  }
}

class Destination {
  const Destination(this.title, this.icon, this.color);

  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Home', Icons.grid_view_rounded, Colors.teal),
  Destination('Calender', Icons.calendar_month, Colors.cyan),
  Destination('Chat', Icons.chat, Colors.orange),
  Destination('Setting', Icons.settings, Colors.blue)
];
