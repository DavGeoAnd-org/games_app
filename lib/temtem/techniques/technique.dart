import 'dart:convert';

class Technique {
  String? id, courseId, synergy;
  bool? courseStatus;
  String name, type, category, targeting;
  int damage, staminaCost, hold, priority;

  Technique(
      {this.id,
      this.courseId,
      this.courseStatus,
      this.synergy,
      required this.name,
      required this.type,
      required this.category,
      required this.targeting,
      required this.damage,
      required this.staminaCost,
      required this.hold,
      required this.priority});

  @override
  String toString() {
    return 'Technique{id: $id, courseId: $courseId, courseStatus: $courseStatus, synergy: $synergy, name: $name, type: $type, category: $category, targeting: $targeting, damage: $damage, staminaCost: $staminaCost, hold: $hold, priority: $priority}';
  }

  factory Technique.fromJson(String source) =>
      Technique.fromMap(json.decode(source));

  factory Technique.fromMap(Map<String, dynamic> map) {
    return Technique(
      id: map['id'],
      courseId: map['courseId'],
      courseStatus: map['courseStatus'],
      synergy: map['synergy'],
      name: map['name'] ?? '',
      type: map['type'] ?? '',
      category: map['category'] ?? '',
      targeting: map['targeting'] ?? '',
      damage: map['damage'] ?? -1,
      staminaCost: map['staminaCost'] ?? -1,
      hold: map['hold'] ?? -1,
      priority: map['priority'] ?? -1,
    );
  }
}

class LevelTechnique {
  Technique technique;
  int level;

  LevelTechnique({required this.technique, required this.level});

  @override
  String toString() {
    return 'LevelTechnique{technique: $technique, level: $level}';
  }

  factory LevelTechnique.fromJson(String source) =>
      LevelTechnique.fromMap(json.decode(source));

  factory LevelTechnique.fromMap(Map<String, dynamic> map) {
    return LevelTechnique(
        technique: Technique.fromMap(map['technique']),
        level: map['level'] ?? -1);
  }
}
