import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/src/core/error/api_failure.dart';
import 'package:movies/src/features/movies/domain/repositories/movies_repository.dart';
import 'package:movies/src/features/movies/domain/usecases/get_popular_movies_use_case.dart';

import '../../data/datasource/__test/movies_test_object.dart';

class MockMoviesRepository extends Mock implements MoviesRepository {}

void main() {
  late MoviesRepository repository;
  late GetPopularMoviesUseCase getPopularMoviesUseCase;

  const int testPage = 1;
  const tFailure = ApiFailure("Server error", 500);

  setUp(() {
    repository = MockMoviesRepository();
    getPopularMoviesUseCase = GetPopularMoviesUseCase(repository);
  });

  test('Should call getPopularMoviesUseCase and return Right(MovieResponse)', () async {
    // Arrange
    when(() => repository.getPopularMovies(testPage))
        .thenAnswer((_) async => const Right(movieResponseTestObject));

    // Act
    final result = await getPopularMoviesUseCase(testPage);

    // Assert
    expect(result, equals(const Right(movieResponseTestObject)));
    verify(() => repository.getPopularMovies(testPage)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('Should call getPopularMoviesUseCase and return Left(ApiFailure)', () async {
    // Arrange
    when(() => repository.getPopularMovies(testPage))
        .thenAnswer((_) async => const Left(tFailure));

    // Act
    final result = await getPopularMoviesUseCase(testPage);

    // Assert
    expect(result, equals(const Left(tFailure)));
    verify(() => repository.getPopularMovies(testPage)).called(1);
    verifyNoMoreInteractions(repository);
  });
}