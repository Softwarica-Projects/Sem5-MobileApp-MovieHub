import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';
import 'package:moviehub/feature/movie/domain/repository/movie_repository.dart';
import 'package:moviehub/feature/search/domain/use_case/saerch_movie_use_case.dart';

class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late SearchMovieUseCase searchMovieUseCase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    searchMovieUseCase = SearchMovieUseCase(mockMovieRepository);
  });

  final testMovies = [
    MovieEntity(
      id: '1',
      title: 'Test Movie 1',
      genreId: '1',
      genre: 'Action',
      runtime: 120,
      releaseDate: '2023-01-01',
      averageRating: 8.5,
      coverImage: 'path1.jpg',
      movieType: 'Feature',
      description: 'Test overview 1',
      cast: [],
      ratings: [],
      isFavourite: false,
    ),
    MovieEntity(
      id: '2',
      title: 'Test Movie 2',
      genreId: '2',
      genre: 'Drama',
      runtime: 110,
      releaseDate: '2023-02-01',
      averageRating: 7.5,
      coverImage: 'path2.jpg',
      movieType: 'Feature',
      description: 'Test overview 2',
      cast: [],
      ratings: [],
      isFavourite: false,
    ),
  ];

  group('SearchMovieUseCase', () {
    test('should return list of movies when repository call is successful', () async {
      const query = 'test';
      when(() => mockMovieRepository.searchMovie(any(), any())).thenAnswer((_) async => testMovies);

      final result = await searchMovieUseCase.call(query);

      expect(result, equals(Right(testMovies)));
      verify(() => mockMovieRepository.searchMovie(query, null)).called(1);
    });

    test('should return empty list when no movies found', () async {
      const query = 'nonexistent movie';
      when(() => mockMovieRepository.searchMovie(any(), any())).thenAnswer((_) async => []);

      final result = await searchMovieUseCase.call(query);

      expect(result.isRight(), true);
      result.fold(
        (error) => fail('Should return success'),
        (movies) => expect(movies, isEmpty),
      );
      verify(() => mockMovieRepository.searchMovie(query, null)).called(1);
    });

    test('should return Exception when repository throws an exception', () async {
      const query = 'test';
      const errorMessage = 'Network error';
      when(() => mockMovieRepository.searchMovie(any(), any())).thenThrow(Exception(errorMessage));

      final result = await searchMovieUseCase.call(query);

      expect(result.isLeft(), true);
      result.fold(
        (exception) => expect(exception.toString(), contains(errorMessage)),
        (movies) => fail('Should return an exception'),
      );
      verify(() => mockMovieRepository.searchMovie(query, null)).called(1);
    });
  });
}
