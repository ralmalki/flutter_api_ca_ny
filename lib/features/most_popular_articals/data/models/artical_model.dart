import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'media_model.dart';
import 'mediametadata_model.dart';

part 'artical_model.g.dart';

@collection
@JsonSerializable()
class ArticalModel {
  Id id;
  String url;
  String published_date;
  String title;
  String abstract;
  String byline;
  List<MediaModel> media;

  ArticalModel({
    required this.id,
    required this.url,
    required this.published_date,
    required this.title,
    required this.abstract,
    required this.byline,
    required this.media,
  });

  factory ArticalModel.fromJson(Map<String, dynamic> json) =>
      _$ArticalModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticalModelToJson(this);
}
