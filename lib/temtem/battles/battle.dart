import 'package:json_annotation/json_annotation.dart';

part 'battle.g.dart';

@JsonSerializable()
class Battle {
  String id, name;

  Battle(this.id, this.name);

  @override
  String toString() {
    return 'Battle{id: $id, name: $name}';
  }

  factory Battle.fromJson(Map<String, dynamic> json) => _$BattleFromJson(json);

  Map<String, dynamic> toJson() => _$BattleToJson(this);
}
