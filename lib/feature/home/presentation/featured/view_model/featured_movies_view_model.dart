// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviehub/core/bloc/state/bloc_state.dart';
import 'package:moviehub/feature/home/domain/use_case/get_featured_movies_usecase.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';

part 'featured_movie_state.dart';
part 'featured_movies_event.dart';

class FeaturedMoviesViewModel extends Bloc<FeaturedMoviesEvent, FeaturedMoviesState> {
  final GetFeaturedMoviesUseCase _useCase;

  FeaturedMoviesViewModel(
    this._useCase,
  ) : super(FeaturedMoviesLoading()) {
    on<FeaturedMoviesRequested>(_onFeaturedMoviesRequested);
    add(FeaturedMoviesRequested());
  }

  Future<void> _onFeaturedMoviesRequested(FeaturedMoviesRequested event, Emitter<FeaturedMoviesState> emit) async {
    emit(FeaturedMoviesLoading());
    var response = await _useCase.call();
    response.fold((e) {
      emit(FeaturedMoviesError(e.toString()));
      return true;
    }, (x) {
      emit(FeaturedMoviesSuccess(movies: x));
      return true;
    });
  }
}
