import 'package:json_annotation/json_annotation.dart';

part 'technique.g.dart';

@JsonSerializable()
class Technique {
  String id, name, type, category, targeting;
  String? courseId, courseStatus, synergy;
  int damage, staminaCost, hold, priority;

  Technique(
      this.id,
      this.name,
      this.courseId,
      this.courseStatus,
      this.type,
      this.synergy,
      this.category,
      this.targeting,
      this.damage,
      this.staminaCost,
      this.hold,
      this.priority);

  @override
  String toString() {
    return 'Technique{id: $id, name: $name, courseId: $courseId, courseStatus: $courseStatus, type: $type, synergy: $synergy, category: $category, targeting: $targeting, damage: $damage, staminaCost: $staminaCost, hold: $hold, priority: $priority}';
  }

  factory Technique.fromJson(Map<String, dynamic> json) =>
      _$TechniqueFromJson(json);

  Map<String, dynamic> toJson() => _$TechniqueToJson(this);
}
