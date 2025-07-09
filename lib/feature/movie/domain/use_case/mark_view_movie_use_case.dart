import 'package:dartz/dartz.dart';
import 'package:moviehub/core/utility/usecase.dart';
import 'package:moviehub/feature/movie/domain/repository/movie_repository.dart';

class MarkViewMovieUseCase implements UsecaseWithParams<void, String> {
  final IMovieRepository _repository;

  MarkViewMovieUseCase(this._repository);
  @override
  Future<Either<Exception, void>> call(String id) async {
    try {
      await _repository.markAsView(id);
      return Right(null);
    } catch (ex) {
      return Future.value(Left(Exception(ex.toString())));
    }
  }
}
