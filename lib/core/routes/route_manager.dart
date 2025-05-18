import 'package:flutter/cupertino.dart';
import 'package:moviehub/core/routes/routes.dart';
import 'package:moviehub/feature/splash/view/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    default:
      return buildRoute(SplashView());
  }
}

buildRoute(Widget child) {
  return CupertinoPageRoute(builder: (_) => child);
}
