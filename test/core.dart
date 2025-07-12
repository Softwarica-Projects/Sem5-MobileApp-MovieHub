import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final GlobalKey<NavigatorState> testNavigatorKey = GlobalKey<NavigatorState>();

Widget getMaterialWidgetForTesting(Widget widget) {
  return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_context, child) {
        return MaterialApp(
          navigatorKey: testNavigatorKey,
          home: widget,
        );
      });
}
