import 'package:flutter/material.dart';
import 'package:movies/src/core/http/remote_http.dart';
import 'package:movies/src/features/movies/data/models/movie_detail/movie_detail.dart';
import 'package:movies/src/features/movies/presentation/movie-detail/widgets/movie_detail_item.dart';
import 'package:movies/src/features/movies/presentation/movie-detail/widgets/placeholder_image.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.movieDetail});

  final MovieDetail movieDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieDetail.title),
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            movieDetail.posterPath != null
                ? Image.network(
              "$baseImage${movieDetail.posterPath}",
              fit: BoxFit.cover,
              height: 400,
              errorBuilder: (context, error, stackTrace) {
                return const PlaceholderImage();
              },
            )
                : const PlaceholderImage(),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieDetailItem(label: "Title", value: movieDetail.title),
                  MovieDetailItem(label: "Genres", value: movieDetail.genres.map((g) => g.name).join(", ")),
                  MovieDetailItem(label: "Release Date", value: movieDetail.releaseDate ?? "Not available"),
                  MovieDetailItem(label: "Overview", value: movieDetail.overview ?? "No overview available"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}