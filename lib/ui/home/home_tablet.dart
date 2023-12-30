import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_daudk/config/themes/layout_values.dart';
import 'package:portfolio_daudk/ui/widgets/constant_widgets.dart';

class HomeTabletScreen extends StatelessWidget {
  const HomeTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Daud k\'s Portfolio Tablet'),
        ),
        drawer: mobileDrawer,
        body: Column(
          children: [MobileTabletHeroSection()],
        ));
  }
}
