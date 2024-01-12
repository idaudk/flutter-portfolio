import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/config/functions.dart';
import 'package:portfolio_daudk/ui/widgets/animated_button.dart';

import '../../config/themes/themes.dart';

class CtaBox extends StatelessWidget {
  const CtaBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [AppColors.cardGrey, AppColors.cardGrey])),
      padding: EdgeInsets.all(LayoutValues.cardsInnerSpace),
      child: DecoratedBox(
        decoration: DottedDecoration(
            shape: Shape.box,
            borderRadius: AppDeco.appBorderRadius,
            strokeWidth: 5,
            dash: const [12, 10],
            color: AppColors.bgGrey),
        child: Container(
          padding: EdgeInsets.all(LayoutValues.cardsInnerSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.sparkles,
                size: 50,
                // color: AppColors.white,
              ),
              Gap(LayoutValues.cardsOuterYSpace),
              Text(
                'YOUR PROJECT GOES HERE',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(),
              ),
              Gap(LayoutValues.cardsOuterYSpace),
              Text(
                'Let’s turn your idea into a visual reality',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Gap(LayoutValues.cardsOuterYSpace + 10),
              AnimatedButton(
                  text: 'Get in Touch',
                  onTap: () {
                    launchMailClient('imdaudk@gmail.com');
                  })
            ],
          ),
        ),
      ),
    );
  }
}
