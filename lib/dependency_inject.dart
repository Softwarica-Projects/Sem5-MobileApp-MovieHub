import 'package:get_it/get_it.dart';
import 'package:moviehub/feature/auth/data/data_source/remote_datasource/auth_remote_datasource.dart';
import 'package:moviehub/feature/auth/data/repository/remote_repository/auth_remote_repository.dart';
import 'package:moviehub/feature/auth/domain/repository/auth_repository.dart';
import 'package:moviehub/feature/auth/domain/use_case/login_usecase.dart';
import 'package:moviehub/feature/auth/domain/use_case/register_usecase.dart';
import 'package:moviehub/feature/auth/presentation/view_model/login/login_view_model.dart';
import 'package:moviehub/feature/auth/presentation/view_model/signup/signup_view_model.dart';
import 'package:moviehub/feature/genre/data/data_source/remote_datasource/genre_remote_datasource.dart';
import 'package:moviehub/feature/genre/data/repository/remote_repository/genre_remote_repository.dart';
import 'package:moviehub/feature/genre/domain/repository/genre_repository.dart';
import 'package:moviehub/feature/home/domain/use_case/get_featured_movies_usecase.dart';
import 'package:moviehub/feature/home/domain/use_case/get_genres_usecase.dart';
import 'package:moviehub/feature/home/domain/use_case/get_popular_movies_usecase.dart';
import 'package:moviehub/feature/home/domain/use_case/get_recently_added_movies_usecase.dart';
import 'package:moviehub/feature/home/presentation/featured/view_model/featured_movies_view_model.dart';
import 'package:moviehub/feature/home/presentation/genre/view_model/genre_list_view_model.dart';
import 'package:moviehub/feature/home/presentation/popular/view_model/popular_list_view_model.dart';
import 'package:moviehub/feature/home/presentation/recently_added/view_model/recently_added_view_model.dart';
import 'package:moviehub/feature/movie/data/data_source/remote_datasource/movie_remote_datasource.dart';
import 'package:moviehub/feature/movie/data/repository/remote_repository/movie_remote_repository.dart';
import 'package:moviehub/feature/movie/domain/repository/movie_repository.dart';
import 'package:moviehub/feature/movie/domain/use_case/get_genre_movie_list.dart';
import 'package:moviehub/feature/movie/presentation/genre_movie_list/view_model/genre_movie_list_view_model.dart';
import 'package:moviehub/services/auth/auth_service.dart';
import 'package:moviehub/services/core/http_service.dart';
import 'package:moviehub/services/core/preference_service.dart';
import 'package:moviehub/services/general/general_service.dart';
import 'package:moviehub/services/movie/movie_service.dart';

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

  // locator.registerFactory<IGenreDataSource>(
  //   () => GenreRemoteDataSource(locator<HttpService>()),
  // );

  // locator.registerSingleton<IMovieDataSource>(
  //   MovieRemoteDataSource(locator<HttpService>()),
  // );
}

_services() {
  final httpService = locator<HttpService>();
  locator.registerSingleton<AuthService>(AuthService(httpService));
  locator.registerSingleton<GeneralService>(GeneralService(httpService));
  locator.registerSingleton<MovieService>(MovieService(httpService));
}

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
}

_viewModel() {
  locator.registerFactory(() => LoginViewModel(locator<LoginUsecase>()));
  locator.registerFactory(() => SignupViewModel(locator<RegisterUsecase>()));

  // Home view models
  locator.registerFactory(() => FeaturedMoviesViewModel(locator<GetFeaturedMoviesUseCase>()));
  locator.registerFactory(() => PopularListViewModel(locator<GetPopularMoviesUseCase>()));
  locator.registerFactory(() => RecentlyAddedViewModel(locator<GetRecentlyAddedMoviesUseCase>()));
  locator.registerFactory(() => GenreListViewModel(locator<GetGenresUseCase>()));
  locator.registerFactoryParam<GenreMovieListViewModel, String?, void>((genreId, _) => GenreMovieListViewModel(locator<GetGenreMovieListUseCase>(), genreId));
}
