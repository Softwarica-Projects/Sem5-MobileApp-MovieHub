import 'package:dartz/dartz.dart';
import 'package:moviehub/core/utility/usecase.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';
import 'package:moviehub/feature/movie/domain/repository/movie_repository.dart';

class GetGenreMovieListUseCase implements UsecaseWithParams<List<MovieEntity>, String?> {
  final IMovieRepository _repository;

  GetGenreMovieListUseCase(this._repository);
  @override
  Future<Either<Exception, List<MovieEntity>>> call(String? id) async {
    try {
      var data = await _repository.searchMovie("", id);
      return Right(data);
    } catch (ex) {
      return Future.value(Left(Exception(ex.toString())));
    }
  }
}
