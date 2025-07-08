import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviehub/feature/movie/domain/entity/rate_movie_entity.dart';
import 'package:moviehub/feature/movie/domain/use_case/rate_movie_use_case.dart';

part 'rate_movie_event.dart';
part 'rate_movie_state.dart';

class RateMovieViewModel extends Bloc<RateMovieEvent, RateMovieState> {
  final RateMovieUseCase _useCase;
  final String movieId;
  RateMovieViewModel(this._useCase, this.movieId) : super(RateMovieInitial()) {
    on<SubmitRating>(_onSubmitRating);
  }

  Future<void> _onSubmitRating(SubmitRating event, Emitter<RateMovieState> emit) async {
    emit(RateMovieLoading());

    var response = await _useCase.call(
      RateMovieEntity(
        id: movieId,
        rating: event.rating,
        review: event.description,
      ),
    );
    response.fold((e) {
      emit(RateMovieError(e.toString()));
      return true;
    }, (x) {
      emit(RateMovieSuccess());
      return true;
    });
  }
}
