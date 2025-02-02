import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/src/core/common/widgets/error_screen.dart';
import 'package:movies/src/features/movies/presentation/movie-detail/cubit/movie_detail_cubit.dart';
import 'package:movies/src/features/movies/presentation/movie-detail/movie_detail_screen.dart';

class MovieDetailController extends StatelessWidget {
  const MovieDetailController({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      builder: (context, state) {
        final bool isLoading = state is MovieDetailLoading;

        if (state is MovieDetailLoaded) {
          return MovieDetailScreen(
            movieDetail: state.movieDetail,
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Movies App"),
            foregroundColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: state is MovieDetailError
              ? ErrorScreen(
                  errorMessage: state.errorMessage,
                  onRetry: () {
                    context.read<MovieDetailCubit>().getMovieDetail(movieId);
                  },
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
