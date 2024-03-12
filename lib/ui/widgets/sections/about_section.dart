import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/config/constants/constants.dart';
import 'package:portfolio_daudk/config/functions.dart';
import 'package:portfolio_daudk/config/resources/asset_manager.dart';
import 'package:portfolio_daudk/ui/widgets/animated_button.dart';
import 'package:portfolio_daudk/ui/widgets/translation.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  bool showSvg = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Translation(),
        Gap(5.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          // child: Stack(
          //   alignment: Alignment.center,
          //   children: [
          //     AnimatedOpacity(
          //       opacity: showSvg == false ? 1 : 0,
          //       duration: const Duration(milliseconds: 500),
          //       child: const Text(
          //         Constants.aboutText,
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //     AnimatedOpacity(
          //         opacity: showSvg == true ? 1 : 0,
          //         duration: const Duration(milliseconds: 500),
          //         child: SvgPicture.asset(
          //           SvgAssets.download,
          //           width: 1200,
          //         )),
          //   ],
          // ),
          child: const Text(
                  Constants.aboutText,
                  textAlign: TextAlign.center,
                ),
        ),
        Gap(30.h),
        MouseRegion(
          // onEnter: (m) {
          //   setState(() {
          //     print(showSvg);
          //     showSvg = true;
          //   });
          // },
          // onExit: (m) {
          //   setState(() {
          //     showSvg = false;
          //     print(showSvg);
          //   });
          // },
          child: AnimatedButton(
            onTap: () {
              launchNewTabClient(
                  'https://drive.google.com/file/d/1O9_06nslWO-dJpsiZGUXgvWTXVSrswBU/view?usp=sharing');
            },
            text: 'Resume',
          ),
        ),
      ],
    );
  }
}
