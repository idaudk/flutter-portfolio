import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_daudk/config/themes/app_themes.dart';
import 'package:portfolio_daudk/config/themes/layout_values.dart';

var mobileDrawer = const Drawer(
  backgroundColor: AppColors.cardGrey,
  child: Column(children: [
    DrawerHeader(
      child: Center(child: Text('DAUD K\'S PORTFOLIO')),
    ),
    ListTile(
      // leading: Icon(Icons.home),
      title: Text(
        'HOME',
      ),
    ),
    ListTile(
      // leading: Icon(Icons.message),
      title: Text('ABOUT'),
    ),
    ListTile(
      // leading: Icon(Icons.settings),
      title: Text('PORTFOLIO'),
    ),
    ListTile(
      // leading: Icon(Icons.logout),
      title: Text('CONTACT'),
    ),
  ]),
);

class MobileTabletHeroSection extends StatelessWidget {
  const MobileTabletHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: LayoutValues.containerYSpace),
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Daud Khan',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                'SOFTWARE ENGINEER, FLUTTER DEVELOPER.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
