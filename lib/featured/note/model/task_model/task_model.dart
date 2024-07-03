// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class Task extends Equatable {
  final String title;
  bool isChecked;

  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  Color? bgColor;

  Task({
    required this.title,
    this.isChecked = false,
    this.bgColor,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);

  @override
  List<Object?> get props => [title, isChecked, bgColor];
}

int? _colorToJson(Color? color) => color?.value;

Color? _colorFromJson(int? colorValue) =>
    colorValue != null ? Color(colorValue) : null;
