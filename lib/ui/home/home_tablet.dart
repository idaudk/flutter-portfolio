import 'package:flutter/material.dart';
import 'package:portfolio_daudk/ui/widgets/constant_widgets.dart';

class HomeTabletScreen extends StatelessWidget {
  const HomeTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daud k\'s Portfolio'),
      ),
      drawer: mobileDrawer,
    );
  }
}
