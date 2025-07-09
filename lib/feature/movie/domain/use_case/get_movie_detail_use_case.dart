import 'package:dartz/dartz.dart';
import 'package:moviehub/core/utility/usecase.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';
import 'package:moviehub/feature/movie/domain/repository/movie_repository.dart';

class GetMovieDetailUseCase implements UsecaseWithParams<MovieEntity, String> {
  final IMovieRepository _repository;

  GetMovieDetailUseCase(this._repository);
  @override
  Future<Either<Exception, MovieEntity>> call(String id) async {
    try {
      var data = await _repository.getById(id);
      return Right(data);
    } catch (ex) {
      return Future.value(Left(Exception(ex.toString())));
    }
  }
}
