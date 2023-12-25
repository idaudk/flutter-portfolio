import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:portfolio_daudk/config/themes/layout_values.dart';
import 'package:portfolio_daudk/ui/widgets/constant_widgets.dart';

class HomeDesktopScreen extends StatelessWidget {
  const HomeDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int _pageIndex = 0;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Daud k\'s Portfolio'),
        centerTitle: false,
        actions: [
          Row(
            children: [
              const Text('Home'),
              Gap(LayoutValues.appXSpace),
              const Text('About'),
              Gap(LayoutValues.appXSpace),
              const Text('Portfolio'),
              Gap(LayoutValues.appXSpace),
              const Text('Contact'),
            ],
          ),
          SizedBox(
            width: LayoutValues.appXSpace,
          )
        ],
      ),
      body: const Row(
        children: [],
      ),
    );
  }
}
