import 'package:dart_mappable/dart_mappable.dart';

part 'character.mapper.dart';

@MappableClass()
class Character with CharacterMappable {
  String id, name, type, gender, side, ctp, ctpStatus;
  bool sixStar, update;
  int shadowland, infinite, silence, burn, paralyze;
  Tier tier;
  Dispatch dispatch;

  Character(
      {required this.id,
      required this.name,
      required this.type,
      required this.gender,
      required this.side,
      required this.ctp,
      required this.ctpStatus,
      required this.sixStar,
      required this.update,
      required this.shadowland,
      required this.infinite,
      required this.silence,
      required this.burn,
      required this.paralyze,
      required this.tier,
      required this.dispatch});
}

@MappableClass()
class Tier with TierMappable {
  String value;
  int level;

  Tier({required this.value, required this.level});
}

@MappableClass()
class Dispatch with DispatchMappable {
  int sector, level;

  Dispatch({required this.sector, required this.level});
}
