import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail.freezed.dart';
part 'movie_detail.g.dart';

@freezed
class MovieDetail with _$MovieDetail {
  const factory MovieDetail({
    required String title,
    @JsonKey(name: 'poster_path') String? posterPath,
    required List<Genre> genres,
    String? overview,
    @JsonKey(name: 'release_date') String? releaseDate,
  }) = _MovieDetail;

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);
}

@freezed
class Genre with _$Genre {
  const factory Genre({
    required String name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) =>
      _$GenreFromJson(json);
}