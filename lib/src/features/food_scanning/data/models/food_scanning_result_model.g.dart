// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_scanning_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodScanningResultModel _$FoodScanningResultModelFromJson(
        Map<String, dynamic> json) =>
    FoodScanningResultModel(
      id: json['id'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      imagePath: json['imagePath'] as String,
      resultOverview: json['resultOverview'] as String,
      questionsResults: (json['questionsResults'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$FoodScanningResultModelToJson(
        FoodScanningResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateTime': instance.dateTime.toIso8601String(),
      'imagePath': instance.imagePath,
      'resultOverview': instance.resultOverview,
      'questionsResults': instance.questionsResults,
    };
