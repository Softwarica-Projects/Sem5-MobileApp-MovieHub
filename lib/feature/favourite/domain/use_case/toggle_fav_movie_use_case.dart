import 'package:dartz/dartz.dart';
import 'package:moviehub/core/utility/usecase.dart';
import 'package:moviehub/feature/favourite/domain/repository/favourite_repository.dart';
import 'package:moviehub/feature/movie/domain/repository/movie_repository.dart';

class ToggleFavMovieUseCase implements UsecaseWithParams<String, String> {
  final IFavouriteRepository _repository;

  ToggleFavMovieUseCase(this._repository);
  @override
  Future<Either<Exception, String>> call(String id) async {
    try {
      var response = await _repository.toggleFavourite(id);
      return Right(response);
    } catch (ex) {
      return Future.value(Left(Exception(ex.toString())));
    }
  }
}
