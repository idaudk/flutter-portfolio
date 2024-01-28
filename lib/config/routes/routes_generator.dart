import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_daudk/ui/home/home_desktop.dart';
import 'package:portfolio_daudk/ui/home/home_mobile.dart';
import 'package:portfolio_daudk/ui/responsive_layout.dart';
import 'package:portfolio_daudk/ui/splash/splash_screen.dart';

import '../../cubits/home/home_cubit.dart';

class Routes {
  // static const String splash = "/";
  static const String home = "/";
}

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings routeSettings) {
    // final args = routeSettings.arguments;

    switch (routeSettings.name) {
      // case Routes.splash:
      //   return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.home:
        // final args = args as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: HomeCubit(),
            child: const ResponsiveLayout(
              desktopScaffold: HomeDesktopScreen(),
              mobileScaffold: HomeMobileScreen(),
              // tabletScaffold: HomeTabletScreen()
            ),
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error while loading new page'),
        ),
      );
    });
  }
}
