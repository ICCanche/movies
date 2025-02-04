import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movies/src/features/movies/data/models/movie/movie.dart';
import 'package:movies/src/features/movies/data/models/movie/movie_response.dart';
import 'package:movies/src/features/movies/domain/usecases/get_popular_movies_use_case.dart';

part 'movies_list_state.dart';

class MoviesListCubit extends Cubit<MoviesListState> {
  MoviesListCubit(this._getPopularMoviesUseCase) : super(MoviesListInitial());

  final GetPopularMoviesUseCase _getPopularMoviesUseCase;
  List<Movie> _movies = [];
  int _currentPage = 1;
  int _totalPages = 1;
  bool _isLoading = false;

  Future<void> loadInitialMovies() async {
    _currentPage = 1;
    _movies.clear();
    emit(MoviesListInitial());
    await _loadMovies();
  }

  Future<void> loadNextPage() async {
    if (_isLoading || _currentPage >= _totalPages) return;
    await _loadMovies();
  }

  Future<void> _loadMovies() async {
    if (_isLoading) return;
    _isLoading = true;
    emit(MoviesListLoading());

    final result = await _getPopularMoviesUseCase(_currentPage);
    result.fold(
          (failure) {
        _isLoading = false;
        emit(MoviesListError(failure.message));
      },
          (movieResponse) {
        _movies.addAll(movieResponse.results);
        _totalPages = movieResponse.totalPages;
        _currentPage++;
        _isLoading = false;
        emit(MoviesListLoaded(_movies));
      },
    );
  }
}