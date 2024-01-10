import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/themes/themes.dart';

class UnderlineText extends StatelessWidget {
  const UnderlineText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: AppDeco.appBorderRadius,
            gradient: const LinearGradient(colors: [
              AppColors.primaryColor,
              Colors.pinkAccent,
              AppColors.primaryColor2
            ]),
          ),
          width: double.infinity,
          height: 10.h,
        ),
        Text(
          text,
          maxLines: 1,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(),
        ),
      ],
    );
  }
}