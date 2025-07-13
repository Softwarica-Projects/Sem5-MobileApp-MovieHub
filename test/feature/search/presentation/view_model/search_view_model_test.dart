import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';
import 'package:moviehub/feature/search/domain/use_case/saerch_movie_use_case.dart';
import 'package:moviehub/feature/search/presentation/view_model/search_view_model.dart';

class MockSearchMovieUseCase extends Mock implements SearchMovieUseCase {}

void main() {
  late SearchViewModel searchViewModel;
  late MockSearchMovieUseCase mockSearchMovieUseCase;

  setUp(() {
    mockSearchMovieUseCase = MockSearchMovieUseCase();
    searchViewModel = SearchViewModel(mockSearchMovieUseCase);
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

  group('SearchViewModel', () {
    test('initial state should be SearchInitial', () {
      expect(searchViewModel.state, isA<SearchInitial>());
    });

    blocTest<SearchViewModel, SearchState>(
      'should emit [SearchLoading, SearchLoaded] when PerformSearch is successful',
      build: () {
        when(() => mockSearchMovieUseCase.call(any())).thenAnswer((_) async => Right(testMovies));
        return searchViewModel;
      },
      act: (bloc) => bloc.add(PerformSearch('test query')),
      expect: () => [
        isA<SearchLoading>(),
        isA<SearchLoaded>(),
      ],
      verify: (_) {
        verify(() => mockSearchMovieUseCase.call('test query')).called(1);
      },
    );

    blocTest<SearchViewModel, SearchState>(
      'should emit [SearchLoading, SearchError] when PerformSearch fails',
      build: () {
        when(() => mockSearchMovieUseCase.call(any())).thenAnswer((_) async => Left(Exception('Network error')));
        return searchViewModel;
      },
      act: (bloc) => bloc.add(PerformSearch('test query')),
      expect: () => [
        isA<SearchLoading>(),
        isA<SearchError>(),
      ],
      verify: (_) {
        verify(() => mockSearchMovieUseCase.call('test query')).called(1);
      },
    );

    blocTest<SearchViewModel, SearchState>(
      'should emit [SearchLoading, SearchLoaded] with empty list when no movies found',
      build: () {
        when(() => mockSearchMovieUseCase.call(any())).thenAnswer((_) async => const Right([]));
        return searchViewModel;
      },
      act: (bloc) => bloc.add(PerformSearch('nonexistent movie')),
      expect: () => [
        isA<SearchLoading>(),
        isA<SearchLoaded>(),
      ],
      verify: (_) {
        verify(() => mockSearchMovieUseCase.call('nonexistent movie')).called(1);
      },
    );
  });
}
