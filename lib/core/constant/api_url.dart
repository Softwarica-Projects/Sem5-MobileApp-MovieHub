// ignore_for_file: file_names

import 'package:moviehub/core/utility/environment.dart';

class ApiUrl {
  static bool get isDevEnv => getEnvironment is DevelopmentEnvironment;
  static String get baseUrl => getEnvironment.baseUrl;

  static String login = "auth/login";
  static String register = "auth/register";
  static String changePassword = "auth/change-password";
  static String updateUser = "auth/update-user";
  static String getUser = "auth/me";

  ///[Movie]
  static String featuredMovies = "movies/featured-movies";
  static String releasingSoonMovies = "movies/soon-releasing";
  static String recentlyAddedMovies = "movies/recent";
  static String popularMovies = "movies/top-viewed";
  static String searchMovie = "movies/search";
  static String movieDetail(String id) => "movies/$id/detail";
  static String rateMovie(String id) => "movies/$id/rate";
  static String markMovieAsView(String id) => "movies/$id/view";
  static String toggleFavourite(String id) => "movies/$id/toggle-favorites";
  static String getFavouriteMovies = "auth/favorites";

  ///[Genre]
  static String genreList = "genres";
}
