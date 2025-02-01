// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      originalTitle: json['originalTitle'] as String,
      posterPath: json['posterPath'] as String,
      backdropPath: json['backdropPath'] as String,
      releaseDate: json['releaseDate'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      voteAverage: (json['voteAverage'] as num).toDouble(),
      voteCount: (json['voteCount'] as num).toInt(),
    );

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'originalTitle': instance.originalTitle,
      'posterPath': instance.posterPath,
      'backdropPath': instance.backdropPath,
      'releaseDate': instance.releaseDate,
      'popularity': instance.popularity,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };
