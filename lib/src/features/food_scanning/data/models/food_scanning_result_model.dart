import 'package:json_annotation/json_annotation.dart';
part 'food_scanning_result_model.g.dart';

@JsonSerializable()
class FoodScanningResultModel {
  const FoodScanningResultModel({
    required this.id,
    required this.dateTime,
    required this.imagePath,
    required this.resultOverview,
    required this.questionsResults,
  });

  final String id;
  final DateTime dateTime;
  final String imagePath;
  final String resultOverview;
  final List<String?> questionsResults;

  factory FoodScanningResultModel.fromJson(Map<String, dynamic> json) =>
      _$FoodScanningResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoodScanningResultModelToJson(this);

  @override
  String toString() {
    return "FoodScanningResultModel(id: $id, dateTime: $dateTime, imagePath: $imagePath, resultOverview: $resultOverview, questionsResults: $questionsResults)\n\n";
  }

  FoodScanningResultModel copyWith({
    String? id,
    DateTime? dateTime,
    String? imagePath,
    String? resultOverview,
    List<String?>? questionsResults,
  }) {
    return FoodScanningResultModel(
      id: id ?? this.id,
      dateTime: dateTime ?? this.dateTime,
      imagePath: imagePath ?? this.imagePath,
      resultOverview: resultOverview ?? this.resultOverview,
      questionsResults: questionsResults ?? this.questionsResults,
    );
  }
}
