import 'package:moviehub/feature/genre/domain/entity/genre_entity.dart';

abstract interface class IGenreDataSource {
  Future<List<GenreEntity>> getGenreList();
}
