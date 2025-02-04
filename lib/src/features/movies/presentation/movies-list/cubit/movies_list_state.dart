part of 'movies_list_cubit.dart';

@immutable
abstract class MoviesListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MoviesListInitial extends MoviesListState {}

class MoviesListLoading extends MoviesListState {}

class MoviesListLoaded extends MoviesListState {
  final List<Movie> movies;

  MoviesListLoaded(this.movies);

  @override
  List<Object?> get props => [movies];
}

class MoviesListError extends MoviesListState {
  final String errorMessage;

  MoviesListError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}