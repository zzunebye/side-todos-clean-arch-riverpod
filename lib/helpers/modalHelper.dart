import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../shared/custom_text_field.dart';
import '../style/custom_spacing.dart';

class ModalHelper {
  static Future<dynamic> showAddTodoModal(BuildContext context, TextEditingController titleController, TextEditingController descController) {
    return showCupertinoModalBottomSheet(
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
                      controller: titleController,
                      hintText: "Title",
                    ),
                    const SizedBox(height: Spacing.medium),
                    CustomTextField(
                      controller: descController,
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
  }
}
