import 'package:flutter/material.dart';
import 'package:portfolio_daudk/ui/widgets/constant_widgets.dart';
import 'package:portfolio_daudk/ui/widgets/section_widget.dart';
import 'package:portfolio_daudk/ui/widgets/sections/expertise_section.dart';
import 'package:portfolio_daudk/ui/widgets/sections/hero_section.dart';

class HomeMobileScreen extends StatelessWidget {
  const HomeMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daud k\'s Portfolio Mobile'),
      ),
      drawer: mobileDrawer,
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SectionWidget(isMobile: true, child: const HeroSection()),
              SectionWidget(
                  isMobile: true,
                  child: ExpertiseSection(
                    isMobile: true,
                  ))
              // MobileTabletHeroSection(),
            ],
          ),
        ),
      ),
    );
  }
}
