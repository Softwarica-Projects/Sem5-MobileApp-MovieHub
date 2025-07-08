import 'package:moviehub/feature/genre/data/data_source/remote_datasource/genre_remote_datasource.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';

abstract interface class IFavouriteRepository {
  IFavouriteRepository(GenreRemoteDataSource genreRemoteDataSource);

  Future<List<MovieEntity>> getFavourites();
  Future<String> toggleFavourite(String id);
}
