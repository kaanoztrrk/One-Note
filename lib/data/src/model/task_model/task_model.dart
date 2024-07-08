import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject with EquatableMixin {
  @HiveField(0)
  late String title;

  @HiveField(1)
  bool isChecked;

  @HiveField(2)
  int bgColor;

  Task({
    required this.title,
    this.isChecked = false,
    required this.bgColor,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        title: json['title'] as String,
        isChecked: json['isChecked'] as bool,
        bgColor: json['bgColor'] as int,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'isChecked': isChecked,
        'bgColor': bgColor,
      };

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

  @override
  List<Object?> get props => [title, isChecked, bgColor];
}
