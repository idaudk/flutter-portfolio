import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/config/constants/constants.dart';
import 'package:portfolio_daudk/ui/widgets/underline_title_widget.dart';

import '../../../config/themes/themes.dart';

class ExpertiseSection extends StatelessWidget {
  final bool isMobile;
  const ExpertiseSection({this.isMobile = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'My Expertise',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Gap(40.h),
        StaggeredGrid.count(
          crossAxisCount: isMobile ? 1 : 2,
          crossAxisSpacing: LayoutValues.cardsOuterYSpace,
          mainAxisSpacing: LayoutValues.cardsOuterXSpace,
          children: List.generate(Constants.expertiseList.length, (index) {
            return TextCell(
              title: Constants.expertiseList[index].title,
              subtext: Constants.expertiseList[index].subTitle,
              description: Constants.expertiseList[index].description,
              icon: Constants.expertiseList[index].icon,
            );
          }),
        )
      ],
    );
  }
}

class TextCell extends StatelessWidget {
  final String title;
  final String subtext;
  final String description;
  final IconData icon;

  const TextCell(
      {required this.title,
      required this.subtext,
      required this.description,
      required this.icon,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.cardGrey,
        padding: EdgeInsets.all(LayoutValues.cardsInnerSpace),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Icon(
                    icon,
                    size: 30.r,
                  ),
                ),
                Gap(30.r),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UnderlineText(text: title),
                      Text(
                        subtext,
                        // maxLines: 1,
                        textAlign: TextAlign.start,
                        // overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(),
                      ),
                      Gap(10.h),
                      Text(description),
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
