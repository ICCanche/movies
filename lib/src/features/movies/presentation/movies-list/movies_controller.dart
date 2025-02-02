import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/src/core/common/widgets/error_screen.dart';
import 'package:movies/src/features/movies/presentation/movies-list/cubit/movies_list_cubit.dart';
import 'package:movies/src/features/movies/presentation/movies-list/movies_screen.dart';

class MoviesController extends StatelessWidget {
  const MoviesController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesListCubit, MoviesListState>(
      builder: (context, state) {
        final bool isLoading = state is MoviesListLoading;

        if (state is MoviesListLoaded) {
          return MoviesScreen(
            movies: state.movies,
            isLoading: isLoading,
            onLoadNextPage: () {
              context.read<MoviesListCubit>().loadNextPage();
            },
          );
        }

        // Always provide a Scaffold
        return Scaffold(
          appBar: AppBar(
            title: const Text("Movies App"),
            foregroundColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: state is MoviesListError
              ? ErrorScreen(
            errorMessage: state.errorMessage,
            onRetry: () {
              context.read<MoviesListCubit>().loadInitialMovies();
            },
          )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}