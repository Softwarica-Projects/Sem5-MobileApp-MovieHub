import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviehub/core/bloc/state/bloc_state.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';
import 'package:moviehub/feature/movie/domain/use_case/get_movie_detail.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailViewModel extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailUseCase _useCase;
  final String movieId;
  MovieDetailViewModel(this._useCase, this.movieId) : super(MovieDetailInitial()) {
    on<FetchMovieDetail>(_onFetchMovieDetail);
    add(FetchMovieDetail());
  }

  Future<void> _onFetchMovieDetail(FetchMovieDetail event, Emitter<MovieDetailState> emit) async {
    emit(MovieDetailLoading());
    final response = await _useCase.call(movieId);
    response.fold((e) {
      emit(MovieDetailError(e.toString()));
      return true;
    }, (x) {
      emit(MovieDetailLoaded(x));
      return true;
    });
  }
}
