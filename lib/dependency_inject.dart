import 'package:get_it/get_it.dart';
import 'package:moviehub/core/domain/use_case/shake_navigation_use_case.dart';
import 'package:moviehub/feature/auth/data/data_source/remote_datasource/auth_remote_datasource.dart';
import 'package:moviehub/feature/auth/data/repository/remote_repository/auth_remote_repository.dart';
import 'package:moviehub/feature/auth/domain/repository/auth_repository.dart';
import 'package:moviehub/feature/auth/domain/use_case/login_usecase.dart';
import 'package:moviehub/feature/auth/domain/use_case/register_usecase.dart';
import 'package:moviehub/feature/auth/presentation/view_model/login/login_view_model.dart';
import 'package:moviehub/feature/auth/presentation/view_model/signup/signup_view_model.dart';
import 'package:moviehub/feature/favourite/data/data_source/remote_datasource/favourite_remote_datasource.dart';
import 'package:moviehub/feature/favourite/data/repository/remote_repository/favourite_remote_repository.dart';
import 'package:moviehub/feature/favourite/domain/repository/favourite_repository.dart';
import 'package:moviehub/feature/favourite/domain/use_case/get_fav_movie_list_use_case.dart';
import 'package:moviehub/feature/favourite/domain/use_case/toggle_fav_movie_use_case.dart';
import 'package:moviehub/feature/favourite/presentation/view_model/fav_movie_list_view_model.dart';
import 'package:moviehub/feature/genre/data/data_source/remote_datasource/genre_remote_datasource.dart';
import 'package:moviehub/feature/genre/data/repository/remote_repository/genre_remote_repository.dart';
import 'package:moviehub/feature/genre/domain/repository/genre_repository.dart';
import 'package:moviehub/feature/home/domain/use_case/get_featured_movies_usecase.dart';
import 'package:moviehub/feature/home/domain/use_case/get_genres_usecase.dart';
import 'package:moviehub/feature/home/domain/use_case/get_popular_movies_usecase.dart';
import 'package:moviehub/feature/home/domain/use_case/get_recently_added_movies_usecase.dart';
import 'package:moviehub/feature/home/domain/use_case/get_releasing_soon_movies_usecase.dart';
import 'package:moviehub/feature/home/presentation/featured/view_model/featured_movies_view_model.dart';
import 'package:moviehub/feature/home/presentation/genre/view_model/genre_list_view_model.dart';
import 'package:moviehub/feature/home/presentation/popular/view_model/popular_list_view_model.dart';
import 'package:moviehub/feature/home/presentation/recently_added/view_model/recently_added_view_model.dart';
import 'package:moviehub/feature/home/presentation/releasing_soon/view_model/releasing_soon_view_model.dart';
import 'package:moviehub/feature/movie/data/data_source/remote_datasource/movie_remote_datasource.dart';
import 'package:moviehub/feature/movie/data/repository/remote_repository/movie_remote_repository.dart';
import 'package:moviehub/feature/movie/domain/repository/movie_repository.dart';
import 'package:moviehub/feature/movie/domain/use_case/get_genre_movie_list_use_case.dart';
import 'package:moviehub/feature/movie/domain/use_case/get_movie_detail_use_case.dart';
import 'package:moviehub/feature/movie/domain/use_case/mark_view_movie_use_case.dart';
import 'package:moviehub/feature/movie/domain/use_case/rate_movie_use_case.dart';
import 'package:moviehub/feature/movie/presentation/genre_movie_list/view_model/genre_movie_list_view_model.dart';
import 'package:moviehub/feature/movie/presentation/movie_detail/view_model/movie_detail/movie_detail_view_model.dart';
import 'package:moviehub/feature/movie/presentation/movie_detail/view_model/rating/rate_movie_view_model.dart';
import 'package:moviehub/feature/profile/data/data_source/remote_datasource/user_remote_datasource.dart';
import 'package:moviehub/feature/profile/data/repository/remote_repository/user_remote_repository.dart';
import 'package:moviehub/feature/profile/domain/repository/user_repository.dart';
import 'package:moviehub/feature/profile/domain/use_case/change_password_use_case.dart';
import 'package:moviehub/feature/profile/domain/use_case/get_user_use_case.dart';
import 'package:moviehub/feature/profile/domain/use_case/logout_use_case%20copy.dart';
import 'package:moviehub/feature/profile/domain/use_case/update_user_use_case.dart';
import 'package:moviehub/feature/profile/presentation/change_password/view_model/change_password_view_model.dart';
import 'package:moviehub/feature/profile/presentation/edit_profile/view_model/edit_profile_view_model.dart';
import 'package:moviehub/feature/profile/presentation/profile/view_model/user_view_model.dart';
import 'package:moviehub/feature/search/domain/use_case/saerch_movie_use_case.dart';
import 'package:moviehub/feature/search/presentation/view_model/search_view_model.dart';
import 'package:moviehub/services/core/http_service.dart';
import 'package:moviehub/services/core/preference_service.dart';

final locator = GetIt.instance;

setupDependencies() async {
  ///[Core]
  locator.registerSingletonAsync<PreferenceService>(
    () => PreferenceService.getInstance(),
  );

  final preferenceService = await locator.getAsync<PreferenceService>();
  locator.registerSingleton<HttpService>(
    HttpService(preferenceService),
  );

  ///[Data Source]
  _dataSource();

  ///[Repository]
  _repository();

  ///[Services]
  _services();

  ///[Use Cases]
  _useCase();

  ///[View Mode]
  _viewModel();
}

_dataSource() {
  // locator.registerFactory<IAuthDataSource>(
  //   () => AuthRemoteDatasource(locator<HttpService>()),
  // );

  locator.registerFactory<AuthRemoteDatasource>(
    () => AuthRemoteDatasource(locator<HttpService>()),
  );

  locator.registerFactory<MovieRemoteDataSource>(
    () => MovieRemoteDataSource(locator<HttpService>()),
  );

  locator.registerFactory<GenreRemoteDataSource>(
    () => GenreRemoteDataSource(locator<HttpService>()),
  );
  locator.registerFactory<FavouriteRemoteDataSource>(
    () => FavouriteRemoteDataSource(locator<HttpService>()),
  );

  locator.registerFactory<UserRemoteDataSource>(
    () => UserRemoteDataSource(locator<HttpService>()),
  );
}

_services() {}

_repository() {
  locator.registerFactory<IAuthRepository>(
    () => AuthRemoteRepository(locator<AuthRemoteDatasource>()),
  );

  locator.registerFactory<IMovieRepository>(
    () => MovieRemoteRepository(locator<MovieRemoteDataSource>()),
  );
  locator.registerFactory<IGenreRepository>(
    () => GenreRemoteRepository(locator<GenreRemoteDataSource>()),
  );
  locator.registerFactory<IFavouriteRepository>(
    () => FavouriteRemoteRepository(locator<FavouriteRemoteDataSource>()),
  );

  locator.registerFactory<IUserRepository>(
    () => UserRemoteRepository(locator<UserRemoteDataSource>()),
  );
}

_useCase() {
  locator.registerFactory(() => LoginUsecase(
        locator<PreferenceService>(),
        locator<IAuthRepository>(),
      ));
  locator.registerFactory(() => RegisterUsecase(
        authRepository: locator<IAuthRepository>(),
      ));

  // Home use cases
  locator.registerFactory(() => GetFeaturedMoviesUseCase(
        locator<IMovieRepository>(),
      ));
  locator.registerFactory(() => GetPopularMoviesUseCase(
        locator<IMovieRepository>(),
      ));
  locator.registerFactory(() => GetRecentlyAddedMoviesUseCase(
        locator<IMovieRepository>(),
      ));
  locator.registerFactory(() => GetGenresUseCase(
        locator<IGenreRepository>(),
      ));
  locator.registerFactory(() => GetGenreMovieListUseCase(
        locator<IMovieRepository>(),
      ));
  locator.registerFactory(() => SearchMovieUseCase(
        locator<IMovieRepository>(),
      ));
  locator.registerFactory(() => GetMovieDetailUseCase(
        locator<IMovieRepository>(),
      ));
  locator.registerFactory(() => RateMovieUseCase(
        locator<IMovieRepository>(),
      ));
  locator.registerFactory(() => MarkViewMovieUseCase(
        locator<IMovieRepository>(),
      ));
  locator.registerFactory(() => GetReleasingSoonMoviesUseCase(
        locator<IMovieRepository>(),
      ));
  locator.registerFactory(() => ToggleFavMovieUseCase(
        locator<IFavouriteRepository>(),
      ));
  locator.registerFactory(() => GetFavMovieListUseCase(
        locator<IFavouriteRepository>(),
      ));
  locator.registerFactory(() => ShakeNavigationUseCase(locator<PreferenceService>()));

  locator.registerFactory(() => ChangePasswordUseCase(
        locator<IAuthRepository>(),
      ));

  locator.registerFactory(() => GetUserUseCase(
        locator<IUserRepository>(),
      ));
  locator.registerFactory(() => UpdateUserUseCase(
        locator<IUserRepository>(),
      ));
  locator.registerFactory(() => LogoutUseCase(
        locator(),
      ));
  //   locf
}

_viewModel() {
  locator.registerFactory(() => LoginViewModel(locator<LoginUsecase>()));
  locator.registerFactory(() => SignupViewModel(locator<RegisterUsecase>()));

  // Home view models
  locator.registerFactory(() => FeaturedMoviesViewModel(locator<GetFeaturedMoviesUseCase>()));
  locator.registerFactory(() => PopularListViewModel(locator<GetPopularMoviesUseCase>()));
  locator.registerFactory(() => RecentlyAddedViewModel(locator<GetRecentlyAddedMoviesUseCase>()));
  locator.registerFactory(() => ReleasingSoonViewModel(locator<GetReleasingSoonMoviesUseCase>()));
  locator.registerFactory(() => GenreListViewModel(locator<GetGenresUseCase>()));
  locator.registerFactoryParam<GenreMovieListViewModel, String?, void>((genreId, _) => GenreMovieListViewModel(locator<GetGenreMovieListUseCase>(), genreId));
  locator.registerFactory(() => SearchViewModel(locator<SearchMovieUseCase>()));
  locator.registerFactory(() => FavMovieListViewModel(locator<GetFavMovieListUseCase>()));
  locator.registerFactoryParam<MovieDetailViewModel, String, void>(
      (movieId, _) => MovieDetailViewModel(locator<GetMovieDetailUseCase>(), locator<MarkViewMovieUseCase>(), locator<ToggleFavMovieUseCase>(), movieId));
  locator.registerFactoryParam<RateMovieViewModel, String, void>((movieId, _) => RateMovieViewModel(locator<RateMovieUseCase>(), movieId));

  locator.registerFactory(() => UserViewModel(locator<GetUserUseCase>(), locator(), locator(), locator()));

  locator.registerFactory(() => ChangePasswordViewModel(locator()));
  locator.registerFactory(() => EditProfileViewModel());
}
