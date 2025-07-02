import 'package:moviehub/feature/genre/data/data_source/genre_data_source.dart';
import 'package:moviehub/feature/genre/domain/entity/genre_entity.dart';
import 'package:moviehub/feature/genre/domain/repository/genre_repository.dart';

class GenreRemoteRepository implements IGenreRepository {
  final IGenreDataSource _dataSource;

  GenreRemoteRepository(this._dataSource);

  @override
  Future<List<GenreEntity>> getGenreList() async {
    final dataList = await _dataSource.getGenreList();
    return dataList;
  }
}
