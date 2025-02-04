import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/src/core/error/api_exception.dart';
import 'package:movies/src/core/error/api_failure.dart';
import 'package:movies/src/features/movies/data/datasource/remote/remote_data_source.dart';
import 'package:movies/src/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:movies/src/features/movies/domain/repositories/movies_repository.dart';

import '../datasource/__test/movies_test_object.dart';

class MockRemoteDataSource extends Mock implements RemoteDataSource {}

void main() {
  late MoviesRepository moviesRepository;
  late MockRemoteDataSource mockRemoteDataSource;

  const int testPage = 1;
  const tException = ApiException(
    message: 'Unknown error occurred',
    statusCode: 500,
  );

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    moviesRepository = MoviesRepositoryImpl(mockRemoteDataSource);
  });

  group('getPopularMovies', () {
    test('Should return MovieResponse when remote call is successful', () async {
      // Arrange
      when(() => mockRemoteDataSource.getPopularMovies(testPage))
          .thenAnswer((_) async => movieResponseTestObject);

      // Act
      final result = await moviesRepository.getPopularMovies(testPage);

      // Assert
      expect(result, equals(Right(movieResponseTestObject)));
      verify(() => mockRemoteDataSource.getPopularMovies(testPage)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('Should return ApiFailure when remote call fails', () async {
      // Arrange
      when(() => mockRemoteDataSource.getPopularMovies(testPage))
          .thenThrow(tException);

      // Act
      final result = await moviesRepository.getPopularMovies(testPage);

      // Assert
      expect(
        result,
        equals(Left(ApiFailure(tException.message, tException.statusCode))),
      );
      verify(() => mockRemoteDataSource.getPopularMovies(testPage)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}