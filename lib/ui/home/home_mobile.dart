import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/ui/widgets/animated_button.dart';
import 'package:portfolio_daudk/ui/widgets/section_widget.dart';
import 'package:portfolio_daudk/ui/widgets/sections/about_section.dart';
import 'package:portfolio_daudk/ui/widgets/sections/experience_section.dart';
import 'package:portfolio_daudk/ui/widgets/sections/expertise_section.dart';
import 'package:portfolio_daudk/ui/widgets/sections/footer_section.dart';
import 'package:portfolio_daudk/ui/widgets/sections/hero_section.dart';
import 'package:portfolio_daudk/ui/widgets/sections/mobile_footer_section.dart';
import 'package:portfolio_daudk/ui/widgets/sections/work_section.dart';

import '../../config/themes/themes.dart';
import '../widgets/header/menu_item.dart';

class HomeMobileScreen extends StatefulWidget {
  const HomeMobileScreen({super.key});

  @override
  State<HomeMobileScreen> createState() => _HomeMobileScreenState();
}

class _HomeMobileScreenState extends State<HomeMobileScreen> {
  var home = GlobalKey();
  var expertise = GlobalKey();
  var work = GlobalKey();
  var experience = GlobalKey();
  var contact = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Function to scroll to a specific SliverToBoxAdapter widget based on key
  void scrollToSection(GlobalKey key) {
    Navigator.pop(context);
    Scrollable.ensureVisible(key.currentContext!,
        curve: Curves.fastOutSlowIn, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daud k._'),
      ),
      drawer: Drawer(
        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        width: ScreenUtil().screenWidth * 0.8,
        backgroundColor: AppColors.cardGrey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding:
              EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w, bottom: 20.h),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DAUD K._',
                      style: Theme.of(context).textTheme.headlineMedium,
                      // textAlign: TextAlign.start,
                    ),
                    Gap(20.h),
                    InkWell(
                        onTap: () {
                          scrollToSection(home);
                        },
                        child: MenuItem(
                            alignLeft: true, number: '01', title: 'home')),
                    Gap(10.h),
                    InkWell(
                        onTap: () {
                          scrollToSection(expertise);
                        },
                        child: MenuItem(
                            alignLeft: true, number: '02', title: 'Expertise')),
                    Gap(10.h),
                    InkWell(
                        onTap: () {
                          scrollToSection(work);
                        },
                        child: MenuItem(
                            alignLeft: true, number: '03', title: 'My Work')),
                    Gap(10.h),
                    InkWell(
                        onTap: () {
                          scrollToSection(experience);
                        },
                        child: MenuItem(
                            alignLeft: true,
                            number: '04',
                            title: 'Experience')),
                  ],
                ),
                Gap(80.h),
                Footer()
              ]),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SectionWidget(key: home, child: const HeroSection()),
              SectionWidget(child: const AboutSection()),
              SectionWidget(
                  key: expertise,
                  child: ExpertiseSection(
                    isMobile: true,
                  )),
              SectionWidget(
                  key: work,
                  child: WorkSection(
                    isMobile: true,
                  )),
              SectionWidget(key: experience, child: const ExperienceSection()),
              const MobileFooterSection()
            ],
          ),
        ),
      ),
    );
  }
}
