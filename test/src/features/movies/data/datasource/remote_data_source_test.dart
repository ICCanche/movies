import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:movies/src/core/error/api_exception.dart';
import 'package:movies/src/features/movies/data/datasource/remote/remote_data_source_impl.dart';
import 'package:movies/src/features/movies/data/models/movie/movie_response.dart';

import '__test/movies_test_object.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late RemoteDataSourceImpl dataSource;
  late http.Client mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = RemoteDataSourceImpl(mockHttpClient);
    registerFallbackValue(Uri());
  });

  group('getPopularMovies', () {
    final url = 'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&sortby=popularity.desc&page=1';
    final jsonResponse = jsonEncode(movieResponseTestObject);

    test('should return a MovieResponse when the status code is 200', () async {
      when(() => mockHttpClient.get(Uri.parse(url), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response(jsonResponse, 200));

      final result = await dataSource.getPopularMovies(1);

      expect(result, isA<MovieResponse>());
      expect(result.page, 2);
      expect(result.totalResults, 969557);
      verify(() => mockHttpClient.get(Uri.parse(url), headers: any(named: 'headers'))).called(1);
    });

    test('should throw ApiException when the status code is not 200', () async {
      when(() => mockHttpClient.get(Uri.parse(url), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(
              () async => await dataSource.getPopularMovies(1),
          throwsA(isA<ApiException>().having((e) => e.statusCode, 'statusCode', 404))
      );
    });
  });
}