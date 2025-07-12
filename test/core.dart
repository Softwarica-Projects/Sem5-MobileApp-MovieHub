import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviehub/core/constant/app_defaults.dart';

Widget getMaterialWidgetForTesting(Widget widget) {
  return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_context, child) {
        AppDefaults.deviceType = MediaQuery.sizeOf(_context).width > 600 ? DeviceType.tablet : DeviceType.mobile;
        return MaterialApp(
          home: widget,
        );
      });
}
