import 'package:flutter/cupertino.dart';
import 'package:movies/src/features/movies/presentation/navigation/router.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MoviesAppRouter();
  }
}