import 'package:movies/src/core/utils/typedef.dart';
import 'package:movies/src/core/utils/usecase/usecase.dart';
import 'package:movies/src/features/movies/data/models/movie/movie_response.dart';
import 'package:movies/src/features/movies/domain/repositories/movies_repository.dart';

class GetPopularMoviesUseCase extends UseCaseParams<MovieResponse, int> {
  const GetPopularMoviesUseCase(this._repository);

  final MoviesRepository _repository;

  @override
  ResultFuture<MovieResponse> call(int page) async =>
      _repository.getPopularMovies(page);
}
