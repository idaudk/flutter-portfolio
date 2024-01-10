import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/data/models/experience_model.dart';
import 'package:portfolio_daudk/ui/widgets/experience_card_widget.dart';

import '../../../config/themes/themes.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ScreenUtil().screenWidth < BreakPoints.mobile;
    return Column(
      children: [
        Text(
          'Professional\nExperience',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(),
        ),
        Gap(40.h),
        StaggeredGrid.count(
          crossAxisCount: isMobile ? 1 : 2,
          crossAxisSpacing: LayoutValues.cardsOuterYSpace,
          mainAxisSpacing: LayoutValues.cardsOuterXSpace,
          children: List.generate(experienceList.length, (index) {
            return ExperienceCard(experienceList[index]);
          }),
        )
      ],
    );
  }
}
