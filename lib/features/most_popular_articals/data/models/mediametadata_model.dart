import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mediametadata_model.g.dart';

@embedded
@JsonSerializable()
class MediametadataModel {
  String? url;
  String? format;
  int? height;
  int? width;

  MediametadataModel({
    this.url,
    this.format,
    this.height,
    this.width,
  });

  factory MediametadataModel.fromJson(Map<String, dynamic> json) =>
      _$MediametadataModelFromJson(json);
}
