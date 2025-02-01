import 'package:movies/src/features/movies/data/models/movie/movie_response.dart';

abstract class RemoteDataSource {
  Future<MovieResponse> getPopularMovies({required String url});
}