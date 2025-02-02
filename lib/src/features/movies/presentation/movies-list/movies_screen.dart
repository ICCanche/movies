import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/src/features/movies/data/models/movie/movie.dart';
import 'package:movies/src/features/movies/presentation/movies-list/widgets/movie_tile.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({
    super.key,
    required this.movies,
    required this.isLoading,
    required this.onLoadNextPage,
  });

  final List<Movie> movies;
  final bool isLoading;
  final VoidCallback onLoadNextPage;

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      widget.onLoadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies App"),
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: widget.isLoading && widget.movies.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                key: const PageStorageKey('MoviesListView'),
                controller: _scrollController,
                itemCount: widget.movies.length,
                itemBuilder: (context, index) {
                  final movie = widget.movies[index];
                  return MovieTile(
                    movie: movie,
                    onTap: () => {},
                  );
                },
              ),
            ),
    );
  }
}
