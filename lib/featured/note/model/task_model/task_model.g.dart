// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      title: json['title'] as String,
      isChecked: json['isChecked'] as bool? ?? false,
      bgColor: _colorFromJson((json['bgColor'] as num?)?.toInt()),
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'title': instance.title,
      'isChecked': instance.isChecked,
      'bgColor': _colorToJson(instance.bgColor),
    };
