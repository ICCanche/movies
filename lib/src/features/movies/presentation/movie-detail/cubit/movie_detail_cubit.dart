import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movies/src/features/movies/data/models/movie_detail/movie_detail.dart';
import 'package:movies/src/features/movies/domain/usecases/get_movie_use_case.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit(this._getMovieDetailUseCase) : super(MovieDetailInitial());

  final GetMovieDetailUseCase _getMovieDetailUseCase;

  Future<void> getMovieDetail(int id) async {
    emit(MovieDetailLoading());

    final result = await _getMovieDetailUseCase.call(id);
    result.fold((failure) {
      emit(MovieDetailError(failure.message));
    }, (movie) {
      emit(
        MovieDetailLoaded(movie),
      );
    });
  }
}
