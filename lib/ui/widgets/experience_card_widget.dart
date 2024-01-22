import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/config/functions.dart';
import 'package:portfolio_daudk/data/models/experience_model.dart';

import '../../config/themes/themes.dart';

class ExperienceCard extends StatelessWidget {
  final Experience _experience;
  const ExperienceCard(this._experience, {super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ScreenUtil().screenWidth < BreakPoints.mobile;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(isMobile
              ? LayoutValues.cardsInnerSpace - 15.w
              : LayoutValues.cardsInnerSpace),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.bottomRight,
                begin: Alignment.topLeft,
                colors: [AppColors.primaryColor, AppColors.primaryColor2]),
          ),
          child: isMobile
              ? Column(
                  children: [
                    Text(
                      _experience.title,
                      // overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      _experience.date,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        _experience.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Text(
                      _experience.date,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
        ),
        Gap(LayoutValues.cardsOuterYSpace),
        Container(
          padding: EdgeInsets.all(LayoutValues.cardsInnerSpace),
          decoration: const BoxDecoration(color: AppColors.cardGrey),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                            onPressed: () {},
                            autofocus: false,
                            icon: const Icon(CupertinoIcons.map_pin_ellipse),
                            label: Text(_experience.location)),
                        Gap(LayoutValues.appYSpace),
                        TextButton.icon(
                            onPressed: () {
                              launchNewTabClient(_experience.link);
                            },
                            autofocus: false,
                            icon: const Icon(CupertinoIcons.link),
                            label: Text(
                              _experience.linkName,
                              overflow: TextOverflow.fade,
                            ))
                      ],
                    )
                  : Row(
                      children: [
                        TextButton.icon(
                            onPressed: () {},
                            autofocus: false,
                            icon: const Icon(CupertinoIcons.map_pin_ellipse),
                            label: Text(_experience.location)),
                        Gap(LayoutValues.appXSpace),
                        TextButton.icon(
                            onPressed: () {
                              launchNewTabClient(_experience.link);
                            },
                            autofocus: false,
                            icon: const Icon(CupertinoIcons.link),
                            label: Text(
                              _experience.linkName,
                              overflow: TextOverflow.fade,
                            ))
                      ],
                    ),
              Gap(LayoutValues.cardsOuterYSpace),
              Text(
                _experience.description,
              ),
              Gap(LayoutValues.cardsOuterYSpace + 10),
              SizedBox(
                width: double.infinity,
                height: 30.h,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _experience.tags.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 3.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: AppDeco.appBorderRadius,
                            color: AppColors.bgGrey),
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: Center(
                          child: Text(
                            _experience.tags[index],
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(height: -0.1),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
