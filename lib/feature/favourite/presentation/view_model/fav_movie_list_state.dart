// ignore: file_names
// part of 'fav_movie_list_state.dart';

import 'package:moviehub/core/bloc/state/bloc_state.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';

abstract class FavMovieState {}

class FavMovieInitial extends FavMovieState {}

class FavMovieLoading extends FavMovieState implements LoadingState {}

class FavMovieLoaded extends FavMovieState implements LoadedState {
  final List<MovieEntity> movies;
  FavMovieLoaded(this.movies);
}

class FavMovieError extends FavMovieState implements ErrorState {
  @override
  final String message;
  FavMovieError(this.message);
}
