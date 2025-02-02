import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/src/features/movies/presentation/navigation/routes/movies_list_route.dart';

class MoviesAppRouter extends StatelessWidget {
  const MoviesAppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Theme.of(context),
        initialRoute: MoviesListRoute.routeName,
        routes: {
          MoviesListRoute.routeName: (context) => const MoviesListRoute()
        });
  }
}
