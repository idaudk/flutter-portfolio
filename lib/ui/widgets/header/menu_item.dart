import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MenuItem extends StatelessWidget {
  final String number;
  final String title;
  final bool alignLeft;
  const MenuItem({
    required this.number,
    required this.title,
    this.alignLeft = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          alignLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Text(
          number,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.w700, height: 0),
        ),
        Text(
          '/ / $title',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
