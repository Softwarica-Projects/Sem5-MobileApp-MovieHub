import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';

abstract interface class IFavouriteDataSource {
  Future<List<MovieEntity>> getFavourites();
  Future<String> toggleFavourite(String id);
}
