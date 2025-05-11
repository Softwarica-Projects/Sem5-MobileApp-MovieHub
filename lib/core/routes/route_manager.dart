import 'package:moviehub/core/routes/routes.dart';
import 'package:moviehub/feature/auth/view/login_view.dart';
import 'package:moviehub/feature/auth/view/signup_view.dart';
import 'package:moviehub/feature/genre/view/genre_list_view.dart';
import 'package:moviehub/feature/home/view/genre_view.dart';
import 'package:moviehub/feature/home/view/home_view.dart';
import 'package:moviehub/feature/splash/view/splash_view.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.loginPage:
      return buildRoute(LoginView());
    case Routes.signupPage:
      return buildRoute(SignupView());
    case Routes.homePage:
      return buildRoute(HomeView());
    case Routes.genreList:
      return buildRoute(GenreListView());
    default:
      return buildRoute(SplashView());
  }
}

buildRoute(Widget child) {
  return CupertinoPageRoute(builder: (_) => child);
}
