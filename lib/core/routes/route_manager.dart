import 'package:flutter/cupertino.dart';
import 'package:moviehub/core/routes/routes.dart';
import 'package:moviehub/feature/auth/view/login_view.dart';
import 'package:moviehub/feature/home/view/dashboad_view.dart';
import 'package:moviehub/feature/splash/view/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.loginPage:
      return buildRoute(LoginView());
    case Routes.homePage:
      return buildRoute(DashboadView());
    default:
      return buildRoute(SplashView());
  }
}

buildRoute(Widget child) {
  return CupertinoPageRoute(builder: (_) => child);
}
