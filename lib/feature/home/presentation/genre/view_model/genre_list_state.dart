part of 'genre_list_view_model.dart';

abstract class GenreListState {}

class GenreListLoading extends GenreListState implements LoadingState {}

class GenreListSuccess extends GenreListState implements LoadedState {
  final List<GenreEntity> list;
  GenreListSuccess({this.list = const []});
}

class GenreListError extends GenreListState implements ErrorState {
  @override
  final String message;
  GenreListError(this.message);
}
