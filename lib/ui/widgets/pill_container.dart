import 'package:flutter/material.dart';

import '../../config/themes/app_themes.dart';
import '../../config/themes/themes.dart';

class PillContainer extends StatelessWidget {
  const PillContainer({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 1, color: AppColors.borderColor)),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(height: 0),
        ));
  }
}
