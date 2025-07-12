import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviehub/core/constant/app_defaults.dart';
import 'package:moviehub/core/routes/route_manager.dart';
import 'package:moviehub/dependency_inject.dart';
import 'package:moviehub/feature/favourite/presentation/view_model/fav_movie_list_view_model.dart';
import 'package:moviehub/feature/profile/presentation/profile/view_model/user_view_model.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toastification/toastification.dart';

import '../core/routes/routes.dart';
import '../core/theme/themes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await setupDependencies();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_context, child) {
          AppDefaults.deviceType = MediaQuery.sizeOf(_context).width > 600 ? DeviceType.tablet : DeviceType.mobile;
          return ToastificationWrapper(
            child: MultiBlocProvider(
              providers: [
                BlocProvider<FavMovieListViewModel>(
                  create: (_) => locator<FavMovieListViewModel>(),
                ),
                BlocProvider<UserViewModel>(
                  create: (_) => locator<UserViewModel>(),
                )
              ],
              child: MaterialApp(
                navigatorKey: navigatorKey,
                debugShowCheckedModeBanner: false,
                initialRoute: Routes.splashPage,
                themeMode: ThemeMode.dark,
                title: AppDefaults.appName,
                builder: (context, child) {
                  return ResponsiveWrapper.builder(child,
                      defaultScale: true,
                      breakpoints: [
                        ResponsiveBreakpoint.resize(100, name: MOBILE),
                        ResponsiveBreakpoint.resize(480, name: MOBILE),
                        ResponsiveBreakpoint.resize(800, name: TABLET),
                        ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                        ResponsiveBreakpoint.autoScale(2460, name: '4K'),
                      ],
                      background: Container(color: Color(0xFFF5F5F5)));
                },
                theme: Themes().theme(),
                onGenerateRoute: onGenerateRoute,
              ),
            ),
          );
        });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = ((X509Certificate cert, String host, int port) {
        return true;
      });
  }
}
