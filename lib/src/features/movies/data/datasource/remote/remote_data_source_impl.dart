import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/src/core/error/api_exception.dart';
import 'package:movies/src/core/http/remote_http.dart';
import 'package:movies/src/features/movies/data/datasource/remote/remote_data_source.dart';
import 'package:movies/src/features/movies/data/models/movie/movie_response.dart';
import 'package:movies/src/features/movies/data/models/movie_detail/movie_detail.dart';

import 'constants.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  const RemoteDataSourceImpl(this._client);

  final http.Client _client;

  @override
  Future<MovieResponse> getPopularMovies(int page) async {
    try {
      final url = '$baseUrl${apiEndpoints["movies"]["getPopular"]}&page=$page';
      final response = await _client.get(
        Uri.parse(url),
        headers: getCommonHeaders(),
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
      throw ApiException(message: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<MovieDetail> getMovieById(int id) async {
    try {
      final url = '$baseUrl${apiEndpoints["movies"]["getMovie"]}/$id';
      final response = await _client.get(
        Uri.parse(url),
        headers: getCommonHeaders(),
      );

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        final movieDetail = MovieDetail.fromJson(decodedResponse);
        return movieDetail;
      } else {
        throw ApiException(
          message: "Error fetching movie detail",
          statusCode: response.statusCode,
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString(), statusCode: 500);
    }
  }
}
