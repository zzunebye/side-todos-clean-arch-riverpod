import 'package:flutter/material.dart';
import 'package:todos_clean_arch_riverpod/core/custom_nav_bar.dart';

class CalenderPage extends StatelessWidget {
  const CalenderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feed details"),
      ),
      body: const Center(
        child: Text("Calender Page"),

      ),
    );
  }
}
