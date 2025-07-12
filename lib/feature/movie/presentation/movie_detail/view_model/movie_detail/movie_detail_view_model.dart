// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviehub/core/bloc/state/bloc_state.dart';
import 'package:moviehub/feature/favourite/domain/use_case/toggle_fav_movie_use_case.dart';
import 'package:moviehub/feature/favourite/presentation/view_model/fav_movie_list_view_model.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';
import 'package:moviehub/feature/movie/domain/use_case/get_movie_detail_use_case.dart';
import 'package:moviehub/feature/movie/domain/use_case/mark_view_movie_use_case.dart';
import 'package:moviehub/main.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailViewModel extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailUseCase _useCase;
  final MarkViewMovieUseCase _markViewUseCase;
  final ToggleFavMovieUseCase _toggleFavUseCase;
  final String movieId;
  MovieDetailViewModel(
    this._useCase,
    this._markViewUseCase,
    this._toggleFavUseCase,
    this.movieId,
  ) : super(MovieDetailInitial()) {
    on<FetchMovieDetail>(_onFetchMovieDetail);
    on<ToggleFavMovie>(_onToggleFavMovie);
    add(FetchMovieDetail());
    _markViewUseCase.call(movieId);
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

  Future<void> _onToggleFavMovie(ToggleFavMovie event, Emitter<MovieDetailState> emit) async {
    final response = await _toggleFavUseCase.call(movieId);
    if (response.isRight()) {
      final movieDetail = await _useCase.call(movieId);
      movieDetail.fold((e) {
        return true;
      }, (y) {
        emit(ToggleFavSuccess(response.getOrElse(() => "Success")));
        navigatorKey.currentState!.context.read<FavMovieListViewModel>().add(FetchMovies());
        emit(MovieDetailLoaded(y));
        return true;
      });
    } else {
      emit(ToggleFavError());
    }
  }
}
