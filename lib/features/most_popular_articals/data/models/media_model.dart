import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mediametadata_model.dart';

part 'media_model.g.dart';

@embedded
@JsonSerializable()
class MediaModel {
  String? type;
  String? caption;
  String? copyright;

  @JsonKey(name: 'media-metadata')
  List<MediametadataModel>? mediametadata;

  MediaModel({
    this.type,
    this.caption,
    this.copyright,
    this.mediametadata,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json);

  Map<String, dynamic> toJson() => _$MediaModelToJson(this);
}
