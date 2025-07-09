import 'package:moviehub/feature/favourite/data/data_source/remote_datasource/favourite_remote_datasource.dart';
import 'package:moviehub/feature/favourite/domain/repository/favourite_repository.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';

class FavouriteRemoteRepository implements IFavouriteRepository {
  final FavouriteRemoteDataSource _dataSource;

  FavouriteRemoteRepository(this._dataSource);

  @override
  Future<List<MovieEntity>> getFavourites() async {
    final movies = await _dataSource.getFavourites();
    return movies;
  }

  @override
  Future<String> toggleFavourite(String id) async {
    return await _dataSource.toggleFavourite(id);
  }
}
