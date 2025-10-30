// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technique.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Technique _$TechniqueFromJson(Map<String, dynamic> json) => Technique(
      json['id'] as String,
      json['name'] as String,
      json['courseId'] as String?,
      json['courseStatus'] as String?,
      json['type'] as String,
      json['synergy'] as String?,
      json['category'] as String,
      json['targeting'] as String,
      (json['damage'] as num).toInt(),
      (json['staminaCost'] as num).toInt(),
      (json['hold'] as num).toInt(),
      (json['priority'] as num).toInt(),
    );

Map<String, dynamic> _$TechniqueToJson(Technique instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'category': instance.category,
      'targeting': instance.targeting,
      'courseId': instance.courseId,
      'courseStatus': instance.courseStatus,
      'synergy': instance.synergy,
      'damage': instance.damage,
      'staminaCost': instance.staminaCost,
      'hold': instance.hold,
      'priority': instance.priority,
    };
