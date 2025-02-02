import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:movies/src/features/movies/data/datasource/remote/remote_data_source.dart';
import 'package:movies/src/features/movies/data/datasource/remote/remote_data_source_impl.dart';
import 'package:movies/src/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:movies/src/features/movies/domain/repositories/movies_repository.dart';
import 'package:movies/src/features/movies/domain/usecases/get_movie_use_case.dart';
import 'package:movies/src/features/movies/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movies/src/features/movies/presentation/movie-detail/cubit/movie_detail_cubit.dart';
import 'package:movies/src/features/movies/presentation/movies-list/cubit/movies_list_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _initMoviesDependencies();
}

Future<void> _initMoviesDependencies() async {
  sl
    ..registerFactory(() => MoviesListCubit(sl()))
    ..registerFactory(() => MovieDetailCubit(sl()))
    //use cases
    ..registerLazySingleton(() => GetPopularMoviesUseCase(sl()))
    ..registerLazySingleton(() => GetMovieDetailUseCase(sl()))
    //repository
    ..registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(sl()))
    //data sources
    ..registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(sl()))
    //external dependencies
    ..registerLazySingleton(() => http.Client());
}
