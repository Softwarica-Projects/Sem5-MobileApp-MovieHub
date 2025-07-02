// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviehub/core/bloc/state/bloc_state.dart';
import 'package:moviehub/feature/home/domain/use_case/get_recently_added_movies_usecase.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';

part 'recently_added_event.dart';
part 'recently_added_state.dart';

class RecentlyAddedViewModel extends Bloc<RecentlyAddedEvent, RecentlyAddedState> {
  final GetRecentlyAddedMoviesUseCase _useCase;

  RecentlyAddedViewModel(
    this._useCase,
  ) : super(RecentlyAddedLoading()) {
    on<RecentlyAddedRequested>(_onRequested);
    add(RecentlyAddedRequested());
  }

  Future<void> _onRequested(RecentlyAddedRequested event, Emitter<RecentlyAddedState> emit) async {
    emit(RecentlyAddedLoading());
    var response = await _useCase.call();
    response.fold((e) {
      emit(RecentlyAddedError(e.toString()));
      return true;
    }, (x) {
      emit(RecentlyAddedSuccess(list: x));
      return true;
    });
  }
}
