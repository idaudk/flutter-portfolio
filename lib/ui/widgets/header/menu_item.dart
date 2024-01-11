import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  String number;
  String title;
  bool alignLeft;
  MenuItem({
    required this.number,
    required this.title,
    this.alignLeft = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Text(
          number,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.w700),
        ),
        Text(
          '/ / $title',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}