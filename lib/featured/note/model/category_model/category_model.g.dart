// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      title: json['title'] as String,
      subTitle: json['subTitle'] as String,
      checkList: (json['checkList'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      isCompletedValue: (json['isCompletedValue'] as num).toDouble(),
      tagList:
          (json['tagList'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subTitle': instance.subTitle,
      'checkList': instance.checkList,
      'tagList': instance.tagList,
      'isCompletedValue': instance.isCompletedValue,
    };
