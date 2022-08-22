import 'package:flutter/material.dart';

class FeedTopBar extends StatelessWidget {
  const FeedTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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