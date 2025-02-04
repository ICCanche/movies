import 'package:movies/src/core/utils/typedef.dart';
import 'package:movies/src/features/movies/data/models/movie/movie_response.dart';
import 'package:movies/src/features/movies/data/models/movie_detail/movie_detail.dart';

abstract class MoviesRepository {
  ResultFuture<MovieResponse> getPopularMovies(int page);
  ResultFuture<MovieDetail> getMovieById(int id);
}