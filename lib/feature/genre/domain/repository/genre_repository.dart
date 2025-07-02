import 'package:moviehub/feature/genre/domain/entity/genre_entity.dart';

abstract interface class IGenreRepository {
  Future<List<GenreEntity>> getGenreList();
}
