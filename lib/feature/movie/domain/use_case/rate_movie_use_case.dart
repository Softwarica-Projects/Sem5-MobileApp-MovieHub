import 'package:dartz/dartz.dart';
import 'package:moviehub/core/utility/usecase.dart';
import 'package:moviehub/feature/movie/domain/entity/rate_movie_entity.dart';
import 'package:moviehub/feature/movie/domain/repository/movie_repository.dart';

class RateMovieUseCase implements UsecaseWithParams<String, RateMovieEntity> {
  final IMovieRepository _repository;

  RateMovieUseCase(this._repository);
  @override
  Future<Either<Exception, String>> call(RateMovieEntity data) async {
    try {
      var response = await _repository.rateMovie(data);
      return Right(response);
    } catch (ex) {
      return Future.value(Left(Exception(ex.toString())));
    }
  }
}
