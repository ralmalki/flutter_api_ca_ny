// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticalsModel _$ArticalsModelFromJson(Map<String, dynamic> json) =>
    ArticalsModel(
      num_results: json['num_results'] as int,
      status: json['status'] as String,
      results: (json['results'] as List<dynamic>)
          .map((e) => ArticalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticalsModelToJson(ArticalsModel instance) =>
    <String, dynamic>{
      'num_results': instance.num_results,
      'status': instance.status,
      'results': instance.results,
    };
