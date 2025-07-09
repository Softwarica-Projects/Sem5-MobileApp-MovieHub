part of 'search_view_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState implements LoadingState {}

class SearchLoaded extends SearchState implements LoadedState {
  final List<MovieEntity> movies;
  SearchLoaded(this.movies);
}

class SearchError extends SearchState implements ErrorState {
  @override
  final String message;
  SearchError(this.message);
}
