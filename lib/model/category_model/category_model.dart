import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import '../task_model/task_model.dart';

part 'category_model.g.dart';

@HiveType(typeId: 1)
class CategoryModel extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String subTitle;

  @HiveField(2)
  final List<Task> checkList;

  @HiveField(3)
  final List<String> tagList;

  @HiveField(4)
  final double isCompletedValue;

  CategoryModel({
    required this.title,
    required this.subTitle,
    required this.checkList,
    required this.isCompletedValue,
    required this.tagList,
  });

  @override
  List<Object?> get props => [
        title,
        subTitle,
        checkList,
        isCompletedValue,
        tagList,
      ];
}
