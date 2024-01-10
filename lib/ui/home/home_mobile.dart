import 'package:flutter/material.dart';
import 'package:portfolio_daudk/config/themes/app_themes.dart';
import 'package:portfolio_daudk/ui/home/home_desktop.dart';
import 'package:portfolio_daudk/ui/widgets/constant_widgets.dart';

class HomeMobileScreen extends StatelessWidget {
  const HomeMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daud k\'s Portfolio Mobile'),
      ),
      drawer: mobileDrawer,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            MobileTabletHeroSection(),
            
          ],
        ),
      ),
    );
  }
}
