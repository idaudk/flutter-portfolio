import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/data/models/experience_model.dart';

import '../../config/themes/app_decorations.dart';
import '../../config/themes/themes.dart';

class ExperienceCard extends StatelessWidget {
  Experience _experience;
  ExperienceCard(this._experience, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(LayoutValues.cardsInnerSpace),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.bottomRight,
                begin: Alignment.topLeft,
                colors: [
                  AppColors.primaryColor,
                  // AppColors.cardGrey,
                  AppColors.primaryColor2
                ]),
          ),
          child: Row(
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
            children: [
              Row(
                children: [
                  TextButton.icon(
                      onPressed: () {},
                      autofocus: false,
                      icon: const Icon(CupertinoIcons.map_pin_ellipse),
                      label: Text(_experience.location)),
                  Gap(LayoutValues.appXSpace),
                  TextButton.icon(
                      onPressed: () {},
                      autofocus: false,
                      icon: const Icon(CupertinoIcons.link),
                      label: Text(_experience.link))
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
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 3.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: AppDeco.appBorderRadius,
                            color: AppColors.bgGrey),
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Center(
                          child: Text(
                            'Flutter',
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