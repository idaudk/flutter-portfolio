import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_daudk/bloc/home_cubit/home_cubit.dart';
import 'package:portfolio_daudk/bloc/mouse_bloc/mouse_bloc.dart';
import 'package:portfolio_daudk/ui/home/home_desktop.dart';
import 'package:portfolio_daudk/ui/home/home_mobile.dart';
import 'package:portfolio_daudk/ui/responsive_layout.dart';

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
          builder: (_) => MultiBlocProvider(
            // value: HomeCubit(),
            providers: [
              BlocProvider(
                create: (_) => HomeCubit(),
              ),
              BlocProvider(
                create: (_) => MouseBloc(),
              ),
            ],
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
