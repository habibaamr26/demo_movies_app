// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataResponseModel _$HomeDataResponseModelFromJson(
  Map<String, dynamic> json,
) => HomeDataResponseModel(
  page: (json['page'] as num).toInt(),
  results: (json['results'] as List<dynamic>)
      .map((e) => HomeDataResultModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalPages: (json['total_pages'] as num).toInt(),
  totalResults: (json['total_results'] as num).toInt(),
);

Map<String, dynamic> _$HomeDataResponseModelToJson(
  HomeDataResponseModel instance,
) => <String, dynamic>{
  'page': instance.page,
  'results': instance.results,
  'total_pages': instance.totalPages,
  'total_results': instance.totalResults,
};

HomeDataResultModel _$HomeDataResultModelFromJson(Map<String, dynamic> json) =>
    HomeDataResultModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      originalLanguage: json['original_language'] as String?,
      releaseDate: json['release_date'] as String?,
      popularity: (json['popularity'] as num).toDouble(),
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
      adult: json['adult'] as bool,
      video: json['video'] as bool,
      genreIds: (json['genre_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$HomeDataResultModelToJson(
  HomeDataResultModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'original_title': instance.originalTitle,
  'overview': instance.overview,
  'poster_path': instance.posterPath,
  'backdrop_path': instance.backdropPath,
  'original_language': instance.originalLanguage,
  'release_date': instance.releaseDate,
  'popularity': instance.popularity,
  'vote_average': instance.voteAverage,
  'vote_count': instance.voteCount,
  'adult': instance.adult,
  'video': instance.video,
  'genre_ids': instance.genreIds,
};
