import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviehub/core/bloc/state/bloc_state.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';
import 'package:moviehub/feature/movie/domain/use_case/get_genre_movie_list_use_case.dart';

part 'genre_movie_list_event.dart';
part 'genre_movie_list_state.dart';

class GenreMovieListViewModel extends Bloc<GenreMovieListEvent, GenreMovieListState> {
  final GetGenreMovieListUseCase _useCase;
  final String? genreId;

  GenreMovieListViewModel(this._useCase, this.genreId) : super(GenreMovieListInitial()) {
    on<FetchGenreMovies>(fetchGenreMovies);
    add(FetchGenreMovies(genreId));
  }

  Future<void> fetchGenreMovies(FetchGenreMovies event, Emitter<GenreMovieListState> emit) async {
    emit(GenreMovieListLoading());

    final response = await _useCase.call(genreId);
    response.fold((e) {
      emit(GenreMovieListError(e.toString()));
      return true;
    }, (x) {
      emit(GenreMovieListLoaded(x));
      return true;
    });
  }
}
