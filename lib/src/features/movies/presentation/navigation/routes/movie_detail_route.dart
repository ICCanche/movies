import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/src/core/di/injection_container.dart';
import 'package:movies/src/features/movies/presentation/movie-detail/cubit/movie_detail_cubit.dart';
import 'package:movies/src/features/movies/presentation/movie-detail/movie_detail_controller.dart';

class MovieDetailRoute extends StatelessWidget {
  const MovieDetailRoute({super.key, required this.movieId});

  final int movieId;
  static const String routeName = "movie-detail";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = sl<MovieDetailCubit>();
        cubit.getMovieDetail(movieId);
        return cubit;
      },
      child: MovieDetailController(movieId: movieId,),
    );
  }
}
