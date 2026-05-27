// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'shadowland.dart';

class ShadowlandMapper extends ClassMapperBase<Shadowland> {
  ShadowlandMapper._();

  static ShadowlandMapper? _instance;
  static ShadowlandMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ShadowlandMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Shadowland';

  static String _$id(Shadowland v) => v.id;
  static const Field<Shadowland, String> _f$id = Field('id', _$id);
  static bool _$current(Shadowland v) => v.current;
  static const Field<Shadowland, bool> _f$current = Field('current', _$current);
  static Set<String> _$charactersUsed(Shadowland v) => v.charactersUsed;
  static const Field<Shadowland, Set<String>> _f$charactersUsed = Field(
    'charactersUsed',
    _$charactersUsed,
  );
  static int _$currentLevel(Shadowland v) => v.currentLevel;
  static const Field<Shadowland, int> _f$currentLevel = Field(
    'currentLevel',
    _$currentLevel,
  );

  @override
  final MappableFields<Shadowland> fields = const {
    #id: _f$id,
    #current: _f$current,
    #charactersUsed: _f$charactersUsed,
    #currentLevel: _f$currentLevel,
  };

  static Shadowland _instantiate(DecodingData data) {
    return Shadowland(
      data.dec(_f$id),
      data.dec(_f$current),
      data.dec(_f$charactersUsed),
      data.dec(_f$currentLevel),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Shadowland fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Shadowland>(map);
  }

  static Shadowland fromJson(String json) {
    return ensureInitialized().decodeJson<Shadowland>(json);
  }
}

mixin ShadowlandMappable {
  String toJson() {
    return ShadowlandMapper.ensureInitialized().encodeJson<Shadowland>(
      this as Shadowland,
    );
  }

  Map<String, dynamic> toMap() {
    return ShadowlandMapper.ensureInitialized().encodeMap<Shadowland>(
      this as Shadowland,
    );
  }

  ShadowlandCopyWith<Shadowland, Shadowland, Shadowland> get copyWith =>
      _ShadowlandCopyWithImpl<Shadowland, Shadowland>(
        this as Shadowland,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ShadowlandMapper.ensureInitialized().stringifyValue(
      this as Shadowland,
    );
  }

  @override
  bool operator ==(Object other) {
    return ShadowlandMapper.ensureInitialized().equalsValue(
      this as Shadowland,
      other,
    );
  }

  @override
  int get hashCode {
    return ShadowlandMapper.ensureInitialized().hashValue(this as Shadowland);
  }
}

extension ShadowlandValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Shadowland, $Out> {
  ShadowlandCopyWith<$R, Shadowland, $Out> get $asShadowland =>
      $base.as((v, t, t2) => _ShadowlandCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ShadowlandCopyWith<$R, $In extends Shadowland, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    bool? current,
    Set<String>? charactersUsed,
    int? currentLevel,
  });
  ShadowlandCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ShadowlandCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Shadowland, $Out>
    implements ShadowlandCopyWith<$R, Shadowland, $Out> {
  _ShadowlandCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Shadowland> $mapper =
      ShadowlandMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    bool? current,
    Set<String>? charactersUsed,
    int? currentLevel,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (current != null) #current: current,
      if (charactersUsed != null) #charactersUsed: charactersUsed,
      if (currentLevel != null) #currentLevel: currentLevel,
    }),
  );
  @override
  Shadowland $make(CopyWithData data) => Shadowland(
    data.get(#id, or: $value.id),
    data.get(#current, or: $value.current),
    data.get(#charactersUsed, or: $value.charactersUsed),
    data.get(#currentLevel, or: $value.currentLevel),
  );

  @override
  ShadowlandCopyWith<$R2, Shadowland, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ShadowlandCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ShadowlandFloorCharactersMapper
    extends ClassMapperBase<ShadowlandFloorCharacters> {
  ShadowlandFloorCharactersMapper._();

  static ShadowlandFloorCharactersMapper? _instance;
  static ShadowlandFloorCharactersMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = ShadowlandFloorCharactersMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'ShadowlandFloorCharacters';

  static int _$floor(ShadowlandFloorCharacters v) => v.floor;
  static const Field<ShadowlandFloorCharacters, int> _f$floor = Field(
    'floor',
    _$floor,
  );
  static List<String> _$characters(ShadowlandFloorCharacters v) => v.characters;
  static const Field<ShadowlandFloorCharacters, List<String>> _f$characters =
      Field('characters', _$characters);

  @override
  final MappableFields<ShadowlandFloorCharacters> fields = const {
    #floor: _f$floor,
    #characters: _f$characters,
  };

  static ShadowlandFloorCharacters _instantiate(DecodingData data) {
    return ShadowlandFloorCharacters(
      data.dec(_f$floor),
      data.dec(_f$characters),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ShadowlandFloorCharacters fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ShadowlandFloorCharacters>(map);
  }

  static ShadowlandFloorCharacters fromJson(String json) {
    return ensureInitialized().decodeJson<ShadowlandFloorCharacters>(json);
  }
}

mixin ShadowlandFloorCharactersMappable {
  String toJson() {
    return ShadowlandFloorCharactersMapper.ensureInitialized()
        .encodeJson<ShadowlandFloorCharacters>(
          this as ShadowlandFloorCharacters,
        );
  }

  Map<String, dynamic> toMap() {
    return ShadowlandFloorCharactersMapper.ensureInitialized()
        .encodeMap<ShadowlandFloorCharacters>(
          this as ShadowlandFloorCharacters,
        );
  }

  ShadowlandFloorCharactersCopyWith<
    ShadowlandFloorCharacters,
    ShadowlandFloorCharacters,
    ShadowlandFloorCharacters
  >
  get copyWith =>
      _ShadowlandFloorCharactersCopyWithImpl<
        ShadowlandFloorCharacters,
        ShadowlandFloorCharacters
      >(this as ShadowlandFloorCharacters, $identity, $identity);
  @override
  String toString() {
    return ShadowlandFloorCharactersMapper.ensureInitialized().stringifyValue(
      this as ShadowlandFloorCharacters,
    );
  }

  @override
  bool operator ==(Object other) {
    return ShadowlandFloorCharactersMapper.ensureInitialized().equalsValue(
      this as ShadowlandFloorCharacters,
      other,
    );
  }

  @override
  int get hashCode {
    return ShadowlandFloorCharactersMapper.ensureInitialized().hashValue(
      this as ShadowlandFloorCharacters,
    );
  }
}

extension ShadowlandFloorCharactersValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ShadowlandFloorCharacters, $Out> {
  ShadowlandFloorCharactersCopyWith<$R, ShadowlandFloorCharacters, $Out>
  get $asShadowlandFloorCharacters => $base.as(
    (v, t, t2) => _ShadowlandFloorCharactersCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ShadowlandFloorCharactersCopyWith<
  $R,
  $In extends ShadowlandFloorCharacters,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get characters;
  $R call({int? floor, List<String>? characters});
  ShadowlandFloorCharactersCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ShadowlandFloorCharactersCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ShadowlandFloorCharacters, $Out>
    implements
        ShadowlandFloorCharactersCopyWith<$R, ShadowlandFloorCharacters, $Out> {
  _ShadowlandFloorCharactersCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ShadowlandFloorCharacters> $mapper =
      ShadowlandFloorCharactersMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get characters =>
      ListCopyWith(
        $value.characters,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(characters: v),
      );
  @override
  $R call({int? floor, List<String>? characters}) => $apply(
    FieldCopyWithData({
      if (floor != null) #floor: floor,
      if (characters != null) #characters: characters,
    }),
  );
  @override
  ShadowlandFloorCharacters $make(CopyWithData data) =>
      ShadowlandFloorCharacters(
        data.get(#floor, or: $value.floor),
        data.get(#characters, or: $value.characters),
      );

  @override
  ShadowlandFloorCharactersCopyWith<$R2, ShadowlandFloorCharacters, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ShadowlandFloorCharactersCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

