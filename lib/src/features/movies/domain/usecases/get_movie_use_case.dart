import 'package:movies/src/core/utils/typedef.dart';
import 'package:movies/src/core/utils/usecase/usecase.dart';
import 'package:movies/src/features/movies/data/models/movie_detail/movie_detail.dart';
import 'package:movies/src/features/movies/domain/repositories/movies_repository.dart';

class GetMovieDetailUseCase extends UseCaseParams<MovieDetail, int> {
  const GetMovieDetailUseCase(this._repository);

  final MoviesRepository _repository;

  @override
  ResultFuture<MovieDetail> call(int id) async => _repository.getMovieById(id);
}
