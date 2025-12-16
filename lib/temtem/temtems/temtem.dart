import 'dart:convert';

import '../techniques/technique.dart';

class Temtem {
  String? id;
  String name;
  bool teamStatus;
  List<String> types, weakTypes, superWeakTypes, strongTypes, superStrongTypes;
  int number,
      hitPoints,
      stamina,
      speed,
      attack,
      defense,
      specialAttack,
      specialDefense;

  Temtem(
      {this.id,
      required this.name,
      required this.teamStatus,
      required this.types,
      required this.weakTypes,
      required this.superWeakTypes,
      required this.strongTypes,
      required this.superStrongTypes,
      required this.number,
      required this.hitPoints,
      required this.stamina,
      required this.speed,
      required this.attack,
      required this.defense,
      required this.specialAttack,
      required this.specialDefense});

  @override
  String toString() {
    return 'Temtem{id: $id, name: $name, teamStatus: $teamStatus, types: $types, weakTypes: $weakTypes, superWeakTypes: $superWeakTypes, strongTypes: $strongTypes, superStrongTypes: $superStrongTypes, number: $number, hitPoints: $hitPoints, stamina: $stamina, speed: $speed, attack: $attack, defense: $defense, specialAttack: $specialAttack, specialDefense: $specialDefense}';
  }

  factory Temtem.fromJson(String source) => Temtem.fromMap(json.decode(source));

  factory Temtem.fromMap(Map<String, dynamic> map) {
    return Temtem(
        id: map['id'],
        name: map['name'] ?? '',
        teamStatus: map['teamStatus'],
        types: List<String>.from(map['types'] as List),
        weakTypes: List<String>.from(map['weakTypes'] as List),
        superWeakTypes: List<String>.from(map['superWeakTypes'] as List),
        strongTypes: List<String>.from(map['strongTypes'] as List),
        superStrongTypes: List<String>.from(map['superStrongTypes'] as List),
        number: map['number'] ?? -1,
        hitPoints: map['hitPoints'] ?? -1,
        stamina: map['stamina'] ?? -1,
        speed: map['speed'] ?? -1,
        attack: map['attack'] ?? -1,
        defense: map['defense'] ?? -1,
        specialAttack: map['specialAttack'] ?? -1,
        specialDefense: map['specialDefense'] ?? -1);
  }
}

class TemtemDetail extends Temtem {
  List<LevelTechnique> levelTechniques;
  List<Technique> courseTechniques;

  TemtemDetail(
      {super.id,
      required super.name,
      required super.teamStatus,
      required super.types,
      required super.weakTypes,
      required super.superWeakTypes,
      required super.strongTypes,
      required super.superStrongTypes,
      required super.number,
      required super.hitPoints,
      required super.stamina,
      required super.speed,
      required super.attack,
      required super.defense,
      required super.specialAttack,
      required super.specialDefense,
      required this.levelTechniques,
      required this.courseTechniques});

  @override
  String toString() {
    return 'TemtemFullDetail{${super.toString()}, levelTechniques: $levelTechniques, courseTechniques: $courseTechniques}';
  }

  factory TemtemDetail.fromJson(String source) =>
      TemtemDetail.fromMap(json.decode(source));

  factory TemtemDetail.fromMap(Map<String, dynamic> map) {
    return TemtemDetail(
        id: map['id'],
        name: map['name'] ?? '',
        teamStatus: map['teamStatus'],
        types: List<String>.from(map['types'] as List),
        weakTypes: List<String>.from(map['weakTypes'] as List),
        superWeakTypes: List<String>.from(map['superWeakTypes'] as List),
        strongTypes: List<String>.from(map['strongTypes'] as List),
        superStrongTypes: List<String>.from(map['superStrongTypes'] as List),
        number: map['number'] ?? -1,
        hitPoints: map['hitPoints'] ?? -1,
        stamina: map['stamina'] ?? -1,
        speed: map['speed'] ?? -1,
        attack: map['attack'] ?? -1,
        defense: map['defense'] ?? -1,
        specialAttack: map['specialAttack'] ?? -1,
        specialDefense: map['specialDefense'] ?? -1,
        levelTechniques: (map['levelTechniques'] as List)
            .map((data) => LevelTechnique.fromMap(data))
            .toList(),
        courseTechniques: (map['courseTechniques'] as List)
            .map((data) => Technique.fromMap(data))
            .toList());
  }
}

class LevelTemtem {
  Temtem temtem;
  int level;

  LevelTemtem({required this.temtem, required this.level});

  @override
  String toString() {
    return 'LevelTemtem{temtem: $temtem, level: $level}';
  }

  factory LevelTemtem.fromJson(String source) =>
      LevelTemtem.fromMap(json.decode(source));

  factory LevelTemtem.fromMap(Map<String, dynamic> map) {
    return LevelTemtem(
        temtem: Temtem.fromMap(map['temtem']), level: map['level'] ?? -1);
  }
}
