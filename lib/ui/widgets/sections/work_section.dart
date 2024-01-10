import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/ui/widgets/cta_box.dart';
import 'package:portfolio_daudk/ui/widgets/underline_title_widget.dart';

import '../../../config/themes/themes.dart';
import '../../../data/models/work_model.dart';

class WorkSection extends StatelessWidget {
  const WorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
            child: Text(
          'My Work',
          style: Theme.of(context).textTheme.displayMedium,

          //   child: ShaderMask(
          // shaderCallback: (Rect bounds) {
          //   return const LinearGradient(
          //     colors: <Color>[
          //       AppColors.primaryColor,
          //       Colors.amberAccent,
          //       Colors.pinkAccent,
          //       AppColors.primaryColor2
          //     ],
          //     tileMode: TileMode.mirror,
          //   ).createShader(bounds);
          // },
          // child: Text(
          //   'My Work',
          //   style: Theme.of(context).textTheme.displayMedium,
          // ),
        )),
        Gap(LayoutValues.widgetYspace),
        StaggeredGrid.count(
          crossAxisSpacing: LayoutValues.cardsOuterYSpace,
          mainAxisSpacing: LayoutValues.cardsOuterXSpace,
          crossAxisCount: 2,
          children: List.generate(workList.length + 1, (index) {
            if (index < workList.length) {
              return Container(
                  padding: EdgeInsets.all(LayoutValues.cardsInnerSpace),
                  decoration: const BoxDecoration(
                    color: AppColors.cardGrey,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              UnderlineText(
                                text: workList[index].title,
                              ),
                              Gap(LayoutValues.cardsInnerSpace),
                              Text(workList[index].description),
                            ],
                          )),
                      Expanded(
                          child: Wrap(
                        direction: Axis.vertical,
                        spacing: LayoutValues.cardsOuterYSpace,
                        crossAxisAlignment: WrapCrossAlignment.end,
                        runSpacing: 20,
                        runAlignment: WrapAlignment.end,
                        alignment: WrapAlignment.end,
                        children: [
                          IconButton.outlined(
                              onPressed: () {},
                              icon: const Icon(CupertinoIcons.link)),
                          IconButton.outlined(
                              onPressed: () {},
                              icon: const Icon(Icons.android)),
                          IconButton.outlined(
                              onPressed: () {}, icon: const Icon(Icons.apple))
                        ],
                      )),
                    ],
                  ));
            } else {
              return CtaBox();
            }
          }),
        ),
      ],
    );
  }
}