import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviehub/feature/favourite/domain/use_case/get_fav_movie_list_use_case.dart';
import 'package:moviehub/feature/favourite/presentation/view_model/fav_movie_list_state.dart';

part 'fav_movie_list_event.dart';
// part 'fav_movie_list_state.dart';

class FavMovieListViewModel extends Bloc<FavMovieEvent, FavMovieState> {
  final GetFavMovieListUseCase _useCase;

  FavMovieListViewModel(
    this._useCase,
  ) : super(FavMovieInitial()) {
    on<FetchMovies>(getList);
  }

  Future<void> getList(FetchMovies event, Emitter<FavMovieState> emit) async {
    emit(FavMovieLoading());

    final response = await _useCase.call();
    response.fold((e) {
      emit(FavMovieError(e.toString()));
      return true;
    }, (x) {
      emit(FavMovieLoaded(x));
      return true;
    });
  }
}
