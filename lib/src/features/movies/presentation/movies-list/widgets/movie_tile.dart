import 'package:flutter/material.dart';
import 'package:movies/src/features/movies/data/models/movie/movie.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;
  final void Function(int movieId) onTap;

  const MovieTile({
    Key? key,
    required this.movie,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key('aliasItem ${movie.id}'),
      leading: movie.getUrlImage() != null
          ? Image.network(movie.getUrlImage()!,
          width: 50, height: 50, fit: BoxFit.cover)
          : null,
      title: Text(movie.originalTitle),
      subtitle: Text("Release date: ${movie.releaseDate}"),
      trailing: Icon(
        Icons.chevron_right,
        color: Colors.grey.shade400,
      ),
      onTap: () => onTap(movie.id),
    );
  }
}
