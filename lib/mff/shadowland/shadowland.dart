import 'package:dart_mappable/dart_mappable.dart';

part 'shadowland.mapper.dart';

@MappableClass()
class Shadowland with ShadowlandMappable {
  String id;
  bool current;
  Set<String> charactersUsed;
  int currentLevel;

  Shadowland(this.id, this.current, this.charactersUsed, this.currentLevel);
}

@MappableClass()
class ShadowlandFloorCharacters with ShadowlandFloorCharactersMappable {
  int floor;
  List<String> characters;

  ShadowlandFloorCharacters(this.floor, this.characters);
}
