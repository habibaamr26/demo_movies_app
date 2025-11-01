import 'package:json_annotation/json_annotation.dart';
part 'home_data_response_model.g.dart';

@JsonSerializable()
class HomeDataResponseModel {
  final int? page;
  final List<HomeDataResultModel>? results;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  @JsonKey(name: 'total_results')
  final int? totalResults;

  HomeDataResponseModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory HomeDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDataResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataResponseModelToJson(this);
}

@JsonSerializable()
class HomeDataResultModel {
  final int id;
  final String? title;

  @JsonKey(name: 'original_title')
  final String? originalTitle;

  final String? overview;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'original_language')
  final String? originalLanguage;

  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @JsonKey(defaultValue: 0.0)
  final double popularity;

  @JsonKey(name: 'vote_average', defaultValue: 0.0)
  final double voteAverage;

  @JsonKey(name: 'vote_count', defaultValue: 0)
  final int voteCount;

  final bool adult;
  final bool video;

  @JsonKey(name: 'genre_ids', defaultValue: [])
  final List<int> genreIds;

  HomeDataResultModel({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.originalLanguage,
    required this.releaseDate,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    required this.adult,
    required this.video,
    required this.genreIds,
  });

  factory HomeDataResultModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDataResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataResultModelToJson(this);
}
