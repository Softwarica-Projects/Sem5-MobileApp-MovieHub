import 'package:moviehub/core/routes/routes.dart';
import 'package:moviehub/feature/auth/view/login_view.dart';
import 'package:moviehub/feature/auth/view/signup_view.dart';
import 'package:moviehub/feature/splash/view/splash_view.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.loginPage:
      return buildRoute(LoginView());
    case Routes.signupPage:
      return buildRoute(SignupView());
    default:
      return buildRoute(SplashView());
  }
}

buildRoute(Widget child) {
  return CupertinoPageRoute(builder: (_) => child);
}
