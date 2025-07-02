// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviehub/core/bloc/state/bloc_state.dart';
import 'package:moviehub/feature/home/domain/use_case/get_popular_movies_usecase.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';

part 'popular_list_event.dart';
part 'popular_list_state.dart';

class PopularListViewModel extends Bloc<PopularListEvent, PopularListState> {
  final GetPopularMoviesUseCase _useCase;

  PopularListViewModel(
    this._useCase,
  ) : super(PopularListLoading()) {
    on<PopularListRequested>(_onRequested);
    add(PopularListRequested());
  }

  Future<void> _onRequested(PopularListRequested event, Emitter<PopularListState> emit) async {
    emit(PopularListLoading());
    var response = await _useCase.call();
    response.fold((e) {
      emit(PopularListError(e.toString()));
      return true;
    }, (x) {
      emit(PopularListSuccess(list: x));
      return true;
    });
  }
}
