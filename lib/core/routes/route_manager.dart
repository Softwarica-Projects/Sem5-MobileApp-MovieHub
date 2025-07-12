import 'package:flutter/cupertino.dart';
import 'package:moviehub/core/routes/routes.dart';
import 'package:moviehub/feature/auth/presentation/view/login_view.dart';
import 'package:moviehub/feature/auth/presentation/view/signup_view.dart';
import 'package:moviehub/feature/dashboard/presentation/view/dashboad_view.dart';
import 'package:moviehub/feature/genre/presentation/view/genre_list_view.dart';
import 'package:moviehub/feature/movie/presentation/genre_movie_list/view/genre_movie_list_view.dart';
import 'package:moviehub/feature/movie/presentation/movie_detail/view/movie_detail_view.dart';
import 'package:moviehub/feature/profile/presentation/change_password/view/change_password.dart';
import 'package:moviehub/feature/profile/presentation/edit_profile/view/edit_profile_view.dart';
import 'package:moviehub/feature/splash/view/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.loginPage:
      return buildRoute(LoginView());
    case Routes.signupPage:
      return buildRoute(SignupView());
    case Routes.homePage:
      return buildRoute(DashboadView());
    case Routes.genreList:
      return buildRoute(GenreListView());
    case Routes.changePassword:
      return buildRoute(ChangePasswordView());

    case Routes.updateProfile:
      return buildRoute(EditProfileView());
    case Routes.genreMovieList:
      return buildRoute(GenreMovieListView(
        genreId: (settings.arguments as Map? ?? {})['genreId'],
      ));
    case Routes.movieDetail:
      return buildRoute(MovieDetailView(
        id: (settings.arguments as Map? ?? {})['id'],
      ));
    default:
      return buildRoute(SplashView());
  }
}

buildRoute(Widget child) {
  return CupertinoPageRoute(builder: (_) => child);
}
