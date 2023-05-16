import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/articals.dart';
import 'artical_model.dart';

part 'articals_model.g.dart';

@JsonSerializable()
class ArticalsModel extends Articals {
  ArticalsModel({
    required int num_results,
    required String status,
    required List<ArticalModel> results,
  }) : super(
        
          num_results: num_results,
          status: status,
          results: results,
        );

  factory ArticalsModel.fromJson(Map<String, dynamic> json) =>
      _$ArticalsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticalsModelToJson(this);
}
