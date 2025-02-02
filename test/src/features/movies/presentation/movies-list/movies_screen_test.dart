import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/src/features/movies/data/models/movie/movie.dart';
import 'package:movies/src/features/movies/presentation/movies-list/movies_screen.dart';
import 'package:movies/src/features/movies/presentation/movies-list/widgets/movie_tile.dart';

class TestHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}

void main() {
  late List<Movie> testMovies;

  setUpAll(() {
    HttpOverrides.global = TestHttpOverrides();
  });

  setUp(() {
    testMovies = [
      const Movie(
        id: 1,
        title: "Movie 1",
        originalTitle: "Original Movie 1",
        posterPath: "assets/mock_image.jpg",
        backdropPath: "assets/mock_backdrop.jpg",
        releaseDate: "2024-01-01",
        popularity: 100.0,
        voteAverage: 8.0,
        voteCount: 1000,
      ),
      const Movie(
        id: 2,
        title: "Movie 2",
        originalTitle: "Original Movie 2",
        posterPath: "assets/mock_image.jpg",
        backdropPath: "assets/mock_backdrop.jpg",
        releaseDate: "2024-02-02",
        popularity: 200.0,
        voteAverage: 7.5,
        voteCount: 500,
      ),
    ];
  });

  testWidgets('Displays app bar title correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MoviesScreen(
          movies: testMovies,
          isLoading: false,
          onLoadNextPage: () {},
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Movies App'), findsOneWidget);
  });

  testWidgets('Shows CircularProgressIndicator when loading with empty movies list',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: MoviesScreen(
              movies: [],
              isLoading: true,
              onLoadNextPage: () {},
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

  testWidgets('Displays movie list when movies are available', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MoviesScreen(
          movies: testMovies,
          isLoading: false,
          onLoadNextPage: () {},
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(MovieTile), findsNWidgets(testMovies.length));
  });

  tearDownAll(() {
    HttpOverrides.global = null;
  });
}