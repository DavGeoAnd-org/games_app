import 'dart:convert';

import 'package:games_app/temtem/techniques/technique.dart';

import '../temtems/temtem.dart';

class Battle {
  String? id;
  String name;

  Battle({this.id, required this.name});

  @override
  String toString() {
    return 'Battle{id: $id, name: $name}';
  }

  factory Battle.fromJson(String source) => Battle.fromMap(json.decode(source));

  factory Battle.fromMap(Map<String, dynamic> map) {
    return Battle(id: map['id'], name: map['name'] ?? '');
  }
}

class TemtemWithLevel {
  Temtem temtem;
  int level;

  TemtemWithLevel({required this.temtem, required this.level});

  @override
  String toString() {
    return 'TemtemWithLevel{temtem: $temtem, level: $level}';
  }

  factory TemtemWithLevel.fromJson(String source) =>
      TemtemWithLevel.fromMap(json.decode(source));

  factory TemtemWithLevel.fromMap(Map<String, dynamic> map) {
    return TemtemWithLevel(
        temtem: Temtem.fromMap(map['temtem']), level: map['level'] ?? -1);
  }
}

class BattleDetail extends Battle {
  List<TemtemWithLevel> levelTemtems;

  BattleDetail({super.id, required super.name, required this.levelTemtems});

  @override
  String toString() {
    return 'BattleDetail{${super.toString()}, levelTemtems: $levelTemtems}';
  }

  factory BattleDetail.fromJson(String source) =>
      BattleDetail.fromMap(json.decode(source));

  factory BattleDetail.fromMap(Map<String, dynamic> map) {
    return BattleDetail(
        id: map['id'],
        name: map['name'] ?? '',
        levelTemtems: (map['levelTemtems'] as List)
            .map((data) => TemtemWithLevel.fromMap(data))
            .toList());
  }
}

class BattleTemtem {
  Temtem temtem;
  Set<String> teamTemtems;

  BattleTemtem({required this.temtem, required this.teamTemtems});

  factory BattleTemtem.fromMap(Map<String, dynamic> map) {
    return BattleTemtem(
        temtem: Temtem.fromMap(map['temtem']),
        teamTemtems: Set<String>.from(map['teamTemtems']));
  }

  factory BattleTemtem.fromJson(String source) =>
      BattleTemtem.fromMap(json.decode(source));
}

class TeamTemtem extends Temtem {
  List<Technique> techniques;

  TeamTemtem(
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
      required this.techniques});

  factory TeamTemtem.fromMap(Map<String, dynamic> map) {
    return TeamTemtem(
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
        techniques: (map['techniques'] as List)
            .map((data) => Technique.fromMap(data))
            .toList());
  }

  factory TeamTemtem.fromJson(String source) =>
      TeamTemtem.fromMap(json.decode(source));
}

class TeamTemtemWithScore {
  TeamTemtem temtem;
  int score;

  TeamTemtemWithScore({required this.temtem, required this.score});

  factory TeamTemtemWithScore.fromMap(Map<String, dynamic> map) {
    return TeamTemtemWithScore(
      temtem: TeamTemtem.fromMap(map['temtem']),
      score: map['score'] ?? -1,
    );
  }

  factory TeamTemtemWithScore.fromJson(String source) =>
      TeamTemtemWithScore.fromMap(json.decode(source));
}

class TeamSetup {
  int teamTemtemLevel;
  Map<String, BattleTemtem> battleTemtems;
  List<TeamTemtemWithScore> teamTemtems;

  TeamSetup(
      {required this.teamTemtemLevel,
      required this.battleTemtems,
      required this.teamTemtems});

  factory TeamSetup.fromJson(String source) =>
      TeamSetup.fromMap(json.decode(source));

  factory TeamSetup.fromMap(Map<String, dynamic> map) {
    return TeamSetup(
        teamTemtemLevel: map['teamTemtemLevel'] ?? -1,
        battleTemtems: (map['battleTemtems'] as Map)
            .map((key, value) => MapEntry(key, BattleTemtem.fromMap(value))),
        teamTemtems: (map['teamTemtems'] as List)
            .map((data) => TeamTemtemWithScore.fromMap(data))
            .toList());
  }
}
