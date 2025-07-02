part of 'popular_list_view_model.dart';

abstract class PopularListState {}

class PopularListLoading extends PopularListState implements LoadingState {}

class PopularListSuccess extends PopularListState implements LoadedState {
  final List<MovieEntity> list;
  PopularListSuccess({this.list = const []});
}

class PopularListError extends PopularListState implements ErrorState {
  @override
  final String message;
  PopularListError(this.message);
}
