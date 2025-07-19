// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviehub/core/bloc/state/bloc_state.dart';
import 'package:moviehub/feature/home/domain/use_case/get_releasing_soon_movies_usecase.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';

part 'releasing_soon_event.dart';
part 'releasing_soon_state.dart';

class ReleasingSoonViewModel extends Bloc<ReleasingSoonEvent, ReleasingSoonState> {
  final GetReleasingSoonMoviesUseCase _useCase;

  ReleasingSoonViewModel(
    this._useCase,
  ) : super(ReleasingSoonLoading()) {
    on<ReleasingSoonRequested>(_onRequested);
    add(ReleasingSoonRequested());
  }

  Future<void> _onRequested(ReleasingSoonRequested event, Emitter<ReleasingSoonState> emit) async {
    emit(ReleasingSoonLoading());
    var response = await _useCase.call();
    response.fold((e) {
      emit(ReleasingSoonError(e.toString()));
      return true;
    }, (x) {
      emit(ReleasingSoonSuccess(list: x));
      return true;
    });
  }
}
