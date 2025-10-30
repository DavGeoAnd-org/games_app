import 'package:json_annotation/json_annotation.dart';

part 'temtem.g.dart';

@JsonSerializable()
class Temtem {
  String id, name, teamStatus;
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
      this.id,
      this.name,
      this.teamStatus,
      this.types,
      this.weakTypes,
      this.superWeakTypes,
      this.strongTypes,
      this.superStrongTypes,
      this.number,
      this.hitPoints,
      this.stamina,
      this.speed,
      this.attack,
      this.defense,
      this.specialAttack,
      this.specialDefense);

  @override
  String toString() {
    return 'Temtem{id: $id, name: $name, teamStatus: $teamStatus, types: $types, weakTypes: $weakTypes, superWeakTypes: $superWeakTypes, strongTypes: $strongTypes, superStrongTypes: $superStrongTypes, number: $number, hitPoints: $hitPoints, stamina: $stamina, speed: $speed, attack: $attack, defense: $defense, specialAttack: $specialAttack, specialDefense: $specialDefense}';
  }

  factory Temtem.fromJson(Map<String, dynamic> json) => _$TemtemFromJson(json);

  Map<String, dynamic> toJson() => _$TemtemToJson(this);
}
