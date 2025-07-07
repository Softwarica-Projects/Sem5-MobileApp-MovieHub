import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviehub/core/bloc/state/bloc_state.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';
import 'package:moviehub/feature/search/domain/use_case/saerch_movie_use_case.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchViewModel extends Bloc<SearchEvent, SearchState> {
  final SearchMovieUseCase _useCase;
  SearchViewModel(this._useCase) : super(SearchInitial()) {
    on<PerformSearch>(_onPerformSearch);
  }

  Future<void> _onPerformSearch(PerformSearch event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    final response = await _useCase.call(event.query);
    response.fold((e) {
      emit(SearchError(e.toString()));
      return true;
    }, (x) {
      emit(SearchLoaded(x));
      return true;
    });
  }
}
