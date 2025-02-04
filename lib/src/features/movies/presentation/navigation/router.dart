import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/src/features/movies/presentation/navigation/routes/movie_detail_route.dart';
import 'package:movies/src/features/movies/presentation/navigation/routes/movies_list_route.dart';

class MoviesAppRouter extends StatelessWidget {
  const MoviesAppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context),
      initialRoute: MoviesListRoute.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case MoviesListRoute.routeName:
            return MaterialPageRoute(
              builder: (context) => const MoviesListRoute(),
            );

          case MovieDetailRoute.routeName:
            final movieId = settings.arguments as int;
            return MaterialPageRoute(
              builder: (context) => MovieDetailRoute(movieId: movieId),
            );

          default:
            return MaterialPageRoute(
              builder: (context) => const Scaffold(
                body: Center(child: Text("Route not found")),
              ),
            );
        }
      },
    );
  }
}


