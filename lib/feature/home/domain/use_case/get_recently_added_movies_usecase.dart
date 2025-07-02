import 'package:dartz/dartz.dart';
import 'package:moviehub/core/utility/usecase.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';

import 'package:moviehub/feature/movie/domain/repository/movie_repository.dart';

class GetRecentlyAddedMoviesUseCase implements UsecaseWithoutParams<List<MovieEntity>> {
  final IMovieRepository _repository;

  GetRecentlyAddedMoviesUseCase(this._repository);
  @override
  Future<Either<Exception, List<MovieEntity>>> call() async {
    try {
      var data = await _repository.getRecentlyAddedMovies();
      return Right(data);
    } catch (ex) {
      return Future.value(Left(Exception(ex.toString())));
    }
  }
}
