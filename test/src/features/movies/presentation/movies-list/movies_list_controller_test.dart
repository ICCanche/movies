import 'dart:io';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/src/core/common/widgets/error_screen.dart';
import 'package:movies/src/features/movies/presentation/movies-list/cubit/movies_list_cubit.dart';
import 'package:movies/src/features/movies/presentation/movies-list/movies_controller.dart';
import 'package:movies/src/features/movies/presentation/movies-list/movies_screen.dart';

import '../../data/datasource/__test/movies_test_object.dart';

class MockMoviesListCubit extends MockCubit<MoviesListState>
    implements MoviesListCubit {}

class TestHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}

void main() {
  late MockMoviesListCubit mockMoviesListCubit;
  late MoviesController moviesController;
  final movieId = 1;

  setUpAll(() {
    HttpOverrides.global = TestHttpOverrides();
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {
    mockMoviesListCubit = MockMoviesListCubit();
    moviesController = MoviesController(
      onMovieClick: (int movieId) {},
    );
  });

  tearDown(() {
    mockMoviesListCubit.close();
  });

  group('MoviesController Widget Tests', () {
    testWidgets(
        'MoviesController renders MoviesScreen when MoviesListLoaded state',
        (WidgetTester tester) async {
      when(() => mockMoviesListCubit.state)
          .thenReturn(MoviesListLoaded(movieResponseTestObject.results));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<MoviesListCubit>.value(
            value: mockMoviesListCubit,
            child: moviesController,
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(MoviesScreen), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(ErrorScreen), findsNothing);
    });

    testWidgets(
        'MoviesController renders ErrorScreen when MoviesListError state',
        (WidgetTester tester) async {
      const errorMessage = 'Failed to load movies';
      when(() => mockMoviesListCubit.state)
          .thenReturn(MoviesListError(errorMessage));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<MoviesListCubit>.value(
            value: mockMoviesListCubit,
            child: moviesController,
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(ErrorScreen), findsOneWidget);
      expect(find.text('Error: $errorMessage'), findsOneWidget);
    });

    testWidgets(
        'MoviesController triggers loadInitialMovies when retry is tapped',
        (WidgetTester tester) async {
      const errorMessage = 'Failed to load movies';
      when(() => mockMoviesListCubit.state)
          .thenReturn(MoviesListError(errorMessage));
      when(() => mockMoviesListCubit.loadInitialMovies())
          .thenAnswer((_) async {});

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<MoviesListCubit>.value(
            value: mockMoviesListCubit,
            child: moviesController,
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      verify(() => mockMoviesListCubit.loadInitialMovies()).called(1);
    });
  });
}
