// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../task_model/task_model.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Equatable {
  final String title;
  final String subTitle;
  final List<Task> checkList;
  final List<String> tagList;
  final double isCompletedValue;

  CategoryModel({
    required this.title,
    required this.subTitle,
    required this.checkList,
    required this.isCompletedValue,
    required this.tagList,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  List<Object?> get props => [
        title,
        subTitle,
        checkList,
        isCompletedValue,
        tagList,
      ];
}
