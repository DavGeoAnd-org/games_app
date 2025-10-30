// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temtem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temtem _$TemtemFromJson(Map<String, dynamic> json) => Temtem(
      json['id'] as String,
      json['name'] as String,
      json['teamStatus'] as String,
      (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      (json['weakTypes'] as List<dynamic>).map((e) => e as String).toList(),
      (json['superWeakTypes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      (json['strongTypes'] as List<dynamic>).map((e) => e as String).toList(),
      (json['superStrongTypes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      (json['number'] as num).toInt(),
      (json['hitPoints'] as num).toInt(),
      (json['stamina'] as num).toInt(),
      (json['speed'] as num).toInt(),
      (json['attack'] as num).toInt(),
      (json['defense'] as num).toInt(),
      (json['specialAttack'] as num).toInt(),
      (json['specialDefense'] as num).toInt(),
    );

Map<String, dynamic> _$TemtemToJson(Temtem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'teamStatus': instance.teamStatus,
      'types': instance.types,
      'weakTypes': instance.weakTypes,
      'superWeakTypes': instance.superWeakTypes,
      'strongTypes': instance.strongTypes,
      'superStrongTypes': instance.superStrongTypes,
      'number': instance.number,
      'hitPoints': instance.hitPoints,
      'stamina': instance.stamina,
      'speed': instance.speed,
      'attack': instance.attack,
      'defense': instance.defense,
      'specialAttack': instance.specialAttack,
      'specialDefense': instance.specialDefense,
    };
