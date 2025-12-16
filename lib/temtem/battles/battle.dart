import 'dart:convert';

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

class BattleDetail extends Battle {
  List<LevelTemtem> temtems;

  BattleDetail({super.id, required super.name, required this.temtems});

  @override
  String toString() {
    return 'BattleDetail{${super.toString()}, temtems: $temtems}';
  }

  factory BattleDetail.fromJson(String source) =>
      BattleDetail.fromMap(json.decode(source));

  factory BattleDetail.fromMap(Map<String, dynamic> map) {
    return BattleDetail(
        id: map['id'],
        name: map['name'] ?? '',
        temtems: (map['temtems'] as List)
            .map((data) => LevelTemtem.fromMap(data))
            .toList());
  }
}

class TeamSetup {
  int avgLevel;
  int highestLevel;
  List<LevelTemtem> battleTemtems;
  Map<String, int> battleTemtemTypeScore;
  Map<String, List<String>> teamTemtemTypes;
  Map<String, int> teamTemtemScore;

  TeamSetup(
      {required this.avgLevel,
      required this.highestLevel,
      required this.battleTemtems,
      required this.battleTemtemTypeScore,
      required this.teamTemtemTypes,
      required this.teamTemtemScore});

  @override
  String toString() {
    return 'TeamSetup{avgLevel: $avgLevel, highestLevel: $highestLevel, battleTemtems: $battleTemtems, battleTemtemTypeScore: $battleTemtemTypeScore, teamTemtemTypes: $teamTemtemTypes, teamTemtemScore: $teamTemtemScore}';
  }

  factory TeamSetup.fromJson(String source) =>
      TeamSetup.fromMap(json.decode(source));

  factory TeamSetup.fromMap(Map<String, dynamic> map) {
    return TeamSetup(
        avgLevel: map['avgLevel'] ?? -1,
        highestLevel: map['highestLevel'] ?? -1,
        battleTemtems: (map['battleTemtems'] as List)
            .map((data) => LevelTemtem.fromMap(data))
            .toList(),
        battleTemtemTypeScore: Map.from(map['battleTemtemTypeScore']),
        teamTemtemTypes: (map['teamTemtemTypes'] as Map)
            .map((key, value) => MapEntry(key, List<String>.from(value))),
        teamTemtemScore: Map.from(map['teamTemtemScore']));
  }
}
