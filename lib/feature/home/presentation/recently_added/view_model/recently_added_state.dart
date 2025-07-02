part of 'recently_added_view_model.dart';

abstract class RecentlyAddedState {}

class RecentlyAddedLoading extends RecentlyAddedState implements LoadingState {}

class RecentlyAddedSuccess extends RecentlyAddedState implements LoadedState {
  final List<MovieEntity> list;
  RecentlyAddedSuccess({this.list = const []});
}

class RecentlyAddedError extends RecentlyAddedState implements ErrorState {
  @override
  final String message;
  RecentlyAddedError(this.message);
}
