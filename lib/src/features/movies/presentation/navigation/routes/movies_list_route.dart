import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/src/core/di/injection_container.dart';
import 'package:movies/src/features/movies/presentation/movies-list/cubit/movies_list_cubit.dart';
import 'package:movies/src/features/movies/presentation/movies-list/movies_controller.dart';

import 'movie_detail_route.dart';

class MoviesListRoute extends StatelessWidget {
  const MoviesListRoute({super.key});

  static const String routeName = "movies-list";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = sl<MoviesListCubit>();
        cubit.loadInitialMovies();
        return cubit;
      },
      child: MoviesController(
        onMovieClick: (movieId) {
          Navigator.pushNamed(
            context,
            MovieDetailRoute.routeName,
            arguments: movieId,
          );
        },
      ),
    );
  }
}
