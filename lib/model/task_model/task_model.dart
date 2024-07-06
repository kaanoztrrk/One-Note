import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject with EquatableMixin {
  @HiveField(0)
  late final String title;

  @HiveField(1)
  bool isChecked;

  @HiveField(2)
  final int bgColor;

  Task({
    required this.title,
    this.isChecked = false,
    required this.bgColor,
  });

  @override
  List<Object?> get props => [title, isChecked, bgColor];

  Task copyWith({
    String? title,
    bool? isChecked,
    int? bgColor,
  }) {
    return Task(
      title: title ?? this.title,
      isChecked: isChecked ?? this.isChecked,
      bgColor: bgColor ?? this.bgColor,
    );
  }
}
