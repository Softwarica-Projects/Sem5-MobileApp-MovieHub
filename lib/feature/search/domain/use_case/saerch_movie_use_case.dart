import 'package:dartz/dartz.dart';
import 'package:moviehub/core/utility/usecase.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';
import 'package:moviehub/feature/movie/domain/repository/movie_repository.dart';

class SearchMovieUseCase implements UsecaseWithParams<List<MovieEntity>, String> {
  final IMovieRepository _repository;

  SearchMovieUseCase(this._repository);
  @override
  Future<Either<Exception, List<MovieEntity>>> call(String query) async {
    try {
      var data = await _repository.searchMovie(query, null);
      return Right(data);
    } catch (ex) {
      return Future.value(Left(Exception(ex.toString())));
    }
  }
}
