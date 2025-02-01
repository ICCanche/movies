import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/src/core/error/api_exception.dart';
import 'package:movies/src/core/http/remote_http.dart';
import 'package:movies/src/features/movies/data/datasource/remote/remote_data_source.dart';
import 'package:movies/src/features/movies/data/models/movie/movie.dart';
import 'package:movies/src/features/movies/data/models/movie/movie_response.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  const RemoteDataSourceImpl(this._client);

  final http.Client _client;

  @override
  Future<MovieResponse> getPopularMovies({required String url}) async {
    try {
      final response = await _client.get(
        Uri.parse('$baseUrl/$url'),
        headers: commonHeaders,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
        final movieResponse = MovieResponse.fromJson(decodedResponse);
        return movieResponse;
      } else {
        throw ApiException(
          message: "Error fetching popular movies",
          statusCode: response.statusCode,
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }
}
