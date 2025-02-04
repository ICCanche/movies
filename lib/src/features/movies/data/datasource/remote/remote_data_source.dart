import 'package:movies/src/features/movies/data/models/movie/movie_response.dart';
import 'package:movies/src/features/movies/data/models/movie_detail/movie_detail.dart';

abstract class RemoteDataSource {
  Future<MovieResponse> getPopularMovies(int page);
  Future<MovieDetail> getMovieById(int id);
}