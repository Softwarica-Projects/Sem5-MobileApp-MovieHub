import 'package:dartz/dartz.dart';
import 'package:moviehub/core/utility/usecase.dart';
import 'package:moviehub/feature/genre/domain/entity/genre_entity.dart';
import 'package:moviehub/feature/genre/domain/repository/genre_repository.dart';

class GetGenresUseCase implements UsecaseWithoutParams<List<GenreEntity>> {
  final IGenreRepository _repository;

  GetGenresUseCase(this._repository);
  @override
  Future<Either<Exception, List<GenreEntity>>> call() async {
    try {
      var data = await _repository.getGenreList();
      return Right(data);
    } catch (ex) {
      return Future.value(Left(Exception(ex.toString())));
    }
  }
}
