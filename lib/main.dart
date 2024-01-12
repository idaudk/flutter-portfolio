import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_daudk/config/themes/app_themes.dart';
import 'package:portfolio_daudk/config/themes/layout_values.dart';

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
        builder: (context, child) {
          bool isMobile = ScreenUtil().screenWidth < BreakPoints.mobile;
          return MaterialApp(
            // scrollBehavior: CustomScrollBehavior(),
            debugShowCheckedModeBanner: false,
            title: 'Daud k\'s Portfolio',
            theme: theme(context, isMobile),
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
