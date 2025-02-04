import 'package:dartz/dartz.dart';
import 'package:movies/src/core/error/api_exception.dart';
import 'package:movies/src/core/error/api_failure.dart';
import 'package:movies/src/core/utils/typedef.dart';
import 'package:movies/src/features/movies/data/datasource/remote/remote_data_source.dart';
import 'package:movies/src/features/movies/data/models/movie/movie_response.dart';
import 'package:movies/src/features/movies/data/models/movie_detail/movie_detail.dart';
import 'package:movies/src/features/movies/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  const MoviesRepositoryImpl(this._remoteDataSource);

  final RemoteDataSource _remoteDataSource;

  @override
  ResultFuture<MovieResponse> getPopularMovies(int page) async {
    try {
      final movies = await _remoteDataSource.getPopularMovies(page);
      return Right(movies);
    } on ApiException catch (e) {
      return Left(
        ApiFailure.fromException(e),
      );
    }
  }

  @override
  ResultFuture<MovieDetail> getMovieById(int id) async {
    try {
      final movie = await _remoteDataSource.getMovieById(id);
      return Right(movie);
    } on ApiException catch(e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
