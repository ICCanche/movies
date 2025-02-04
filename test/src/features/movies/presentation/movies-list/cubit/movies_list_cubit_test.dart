import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/src/core/error/api_failure.dart';
import 'package:movies/src/features/movies/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movies/src/features/movies/presentation/movies-list/cubit/movies_list_cubit.dart';

import '../../../data/datasource/__test/movies_test_object.dart';

class MockGetPopularMoviesUseCase extends Mock implements GetPopularMoviesUseCase {}

void main() {
  late MockGetPopularMoviesUseCase mockGetPopularMoviesUseCase;
  late MoviesListCubit moviesListCubit;

  const int testPage = 1;
  const tFailure = ApiFailure("Server error", 500);

  setUp(() {
    mockGetPopularMoviesUseCase = MockGetPopularMoviesUseCase();
    moviesListCubit = MoviesListCubit(mockGetPopularMoviesUseCase);
  });

  tearDown(() {
    moviesListCubit.close();
  });

  test('Initial state should be [MoviesListInitial]', () {
    expect(moviesListCubit.state, equals(MoviesListInitial()));
  });

  group('loadInitialMovies', () {
    blocTest<MoviesListCubit, MoviesListState>(
      'Should emit [MoviesListLoading, MoviesListLoaded] when successful',
      build: () {
        when(() => mockGetPopularMoviesUseCase(testPage))
            .thenAnswer((_) async => const Right(movieResponseTestObject));
        return moviesListCubit;
      },
      act: (cubit) async => await cubit.loadInitialMovies(),
      expect: () => [
        MoviesListInitial(),
        MoviesListLoading(),
        MoviesListLoaded(movieResponseTestObject.results),
      ],
      verify: (_) {
        verify(() => mockGetPopularMoviesUseCase(testPage)).called(1);
        verifyNoMoreInteractions(mockGetPopularMoviesUseCase);
      },
    );

    blocTest<MoviesListCubit, MoviesListState>(
      'Should emit [MoviesListLoading, MoviesListError] when an error occurs',
      build: () {
        when(() => mockGetPopularMoviesUseCase(testPage))
            .thenAnswer((_) async => const Left(tFailure));
        return moviesListCubit;
      },
      act: (cubit) => cubit.loadInitialMovies(),
      expect: () => [
        MoviesListInitial(),
        MoviesListLoading(),
        MoviesListError(tFailure.message),
      ],
      verify: (_) {
        verify(() => mockGetPopularMoviesUseCase(testPage)).called(1);
        verifyNoMoreInteractions(mockGetPopularMoviesUseCase);
      },
    );
  });

  group('loadNextPage', () {
    blocTest<MoviesListCubit, MoviesListState>(
      'Should not fetch data if already loading or at last page',
      build: () {
        when(() => mockGetPopularMoviesUseCase(any()))
            .thenAnswer((_) async => const Right(movieResponseTestObject));
        return moviesListCubit;
      },
      act: (cubit) {
        cubit.loadInitialMovies();
        cubit.loadNextPage();
      },
      skip: 2,
      expect: () => [
        MoviesListLoaded(movieResponseTestObject.results),
      ],
      verify: (_) {
        verify(() => mockGetPopularMoviesUseCase(testPage)).called(1);
        verifyNoMoreInteractions(mockGetPopularMoviesUseCase);
      },
    );
  });
}