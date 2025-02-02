import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/src/core/http/remote_http.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    @JsonKey(name: 'original_title') required String originalTitle,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'release_date') String? releaseDate,
    required double popularity,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) =>
      _$MovieFromJson(json);
}

extension MovieExtensions on Movie {
  String? getUrlImage() {
    return posterPath != null ? '$baseImage$posterPath' : null;
  }
}