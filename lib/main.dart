import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_daudk/config/themes/app_themes.dart';
import 'package:portfolio_daudk/ui/responsive_layout.dart';

import 'config/routes/routes_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        // designSize: const Size(390, 844),
        builder: (context, child) {
          return MaterialApp(
            // scrollBehavior: CustomScrollBehavior(),
            debugShowCheckedModeBanner: false,
            title: 'Daud k\'s Portfolio',
            theme: theme(context),
            // home: NewScreen
            // home: ResponsiveLayout(mobileScaffold: mobileScaffold, tabletScaffold: tabletScaffold, desktopScaffold: desktopScaffold),
            initialRoute: Routes.home,
            onGenerateRoute: RouteGenerator().generateRoute,
          );
        });
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
