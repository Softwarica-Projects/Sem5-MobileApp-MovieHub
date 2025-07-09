part of 'releasing_soon_view_model.dart';

abstract class ReleasingSoonState {}

class ReleasingSoonLoading extends ReleasingSoonState implements LoadingState {}

class ReleasingSoonSuccess extends ReleasingSoonState implements LoadedState {
  final List<MovieEntity> list;
  ReleasingSoonSuccess({this.list = const []});
}

class ReleasingSoonError extends ReleasingSoonState implements ErrorState {
  @override
  final String message;
  ReleasingSoonError(this.message);
}
