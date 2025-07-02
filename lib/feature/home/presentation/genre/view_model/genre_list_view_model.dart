// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviehub/core/bloc/state/bloc_state.dart';
import 'package:moviehub/feature/genre/domain/entity/genre_entity.dart';
import 'package:moviehub/feature/home/domain/use_case/get_genres_usecase.dart';

part 'genre_list_event.dart';
part 'genre_list_state.dart';

class GenreListViewModel extends Bloc<GenreListEvent, GenreListState> {
  final GetGenresUseCase _useCase;

  GenreListViewModel(
    this._useCase,
  ) : super(GenreListLoading()) {
    on<GenreListRequested>(_onRequested);
    add(GenreListRequested());
  }

  Future<void> _onRequested(GenreListRequested event, Emitter<GenreListState> emit) async {
    emit(GenreListLoading());
    var response = await _useCase.call();
    response.fold((e) {
      emit(GenreListError(e.toString()));
      return true;
    }, (x) {
      emit(GenreListSuccess(list: [GenreEntity(id: "-1", name: "   All   "), ...x]));
      return true;
    });
  }
}
