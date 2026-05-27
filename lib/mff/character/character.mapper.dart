// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'character.dart';

class CharacterMapper extends ClassMapperBase<Character> {
  CharacterMapper._();

  static CharacterMapper? _instance;
  static CharacterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CharacterMapper._());
      TierMapper.ensureInitialized();
      DispatchMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Character';

  static String _$id(Character v) => v.id;
  static const Field<Character, String> _f$id = Field('id', _$id);
  static String _$name(Character v) => v.name;
  static const Field<Character, String> _f$name = Field('name', _$name);
  static String _$type(Character v) => v.type;
  static const Field<Character, String> _f$type = Field('type', _$type);
  static String _$gender(Character v) => v.gender;
  static const Field<Character, String> _f$gender = Field('gender', _$gender);
  static String _$side(Character v) => v.side;
  static const Field<Character, String> _f$side = Field('side', _$side);
  static String _$ctp(Character v) => v.ctp;
  static const Field<Character, String> _f$ctp = Field('ctp', _$ctp);
  static String _$ctpStatus(Character v) => v.ctpStatus;
  static const Field<Character, String> _f$ctpStatus = Field(
    'ctpStatus',
    _$ctpStatus,
  );
  static bool _$sixStar(Character v) => v.sixStar;
  static const Field<Character, bool> _f$sixStar = Field('sixStar', _$sixStar);
  static bool _$update(Character v) => v.update;
  static const Field<Character, bool> _f$update = Field('update', _$update);
  static int _$shadowland(Character v) => v.shadowland;
  static const Field<Character, int> _f$shadowland = Field(
    'shadowland',
    _$shadowland,
  );
  static int _$infinite(Character v) => v.infinite;
  static const Field<Character, int> _f$infinite = Field(
    'infinite',
    _$infinite,
  );
  static int _$silence(Character v) => v.silence;
  static const Field<Character, int> _f$silence = Field('silence', _$silence);
  static int _$burn(Character v) => v.burn;
  static const Field<Character, int> _f$burn = Field('burn', _$burn);
  static int _$paralyze(Character v) => v.paralyze;
  static const Field<Character, int> _f$paralyze = Field(
    'paralyze',
    _$paralyze,
  );
  static Tier _$tier(Character v) => v.tier;
  static const Field<Character, Tier> _f$tier = Field('tier', _$tier);
  static Dispatch _$dispatch(Character v) => v.dispatch;
  static const Field<Character, Dispatch> _f$dispatch = Field(
    'dispatch',
    _$dispatch,
  );

  @override
  final MappableFields<Character> fields = const {
    #id: _f$id,
    #name: _f$name,
    #type: _f$type,
    #gender: _f$gender,
    #side: _f$side,
    #ctp: _f$ctp,
    #ctpStatus: _f$ctpStatus,
    #sixStar: _f$sixStar,
    #update: _f$update,
    #shadowland: _f$shadowland,
    #infinite: _f$infinite,
    #silence: _f$silence,
    #burn: _f$burn,
    #paralyze: _f$paralyze,
    #tier: _f$tier,
    #dispatch: _f$dispatch,
  };

  static Character _instantiate(DecodingData data) {
    return Character(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      type: data.dec(_f$type),
      gender: data.dec(_f$gender),
      side: data.dec(_f$side),
      ctp: data.dec(_f$ctp),
      ctpStatus: data.dec(_f$ctpStatus),
      sixStar: data.dec(_f$sixStar),
      update: data.dec(_f$update),
      shadowland: data.dec(_f$shadowland),
      infinite: data.dec(_f$infinite),
      silence: data.dec(_f$silence),
      burn: data.dec(_f$burn),
      paralyze: data.dec(_f$paralyze),
      tier: data.dec(_f$tier),
      dispatch: data.dec(_f$dispatch),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Character fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Character>(map);
  }

  static Character fromJson(String json) {
    return ensureInitialized().decodeJson<Character>(json);
  }
}

mixin CharacterMappable {
  String toJson() {
    return CharacterMapper.ensureInitialized().encodeJson<Character>(
      this as Character,
    );
  }

  Map<String, dynamic> toMap() {
    return CharacterMapper.ensureInitialized().encodeMap<Character>(
      this as Character,
    );
  }

  CharacterCopyWith<Character, Character, Character> get copyWith =>
      _CharacterCopyWithImpl<Character, Character>(
        this as Character,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CharacterMapper.ensureInitialized().stringifyValue(
      this as Character,
    );
  }

  @override
  bool operator ==(Object other) {
    return CharacterMapper.ensureInitialized().equalsValue(
      this as Character,
      other,
    );
  }

  @override
  int get hashCode {
    return CharacterMapper.ensureInitialized().hashValue(this as Character);
  }
}

extension CharacterValueCopy<$R, $Out> on ObjectCopyWith<$R, Character, $Out> {
  CharacterCopyWith<$R, Character, $Out> get $asCharacter =>
      $base.as((v, t, t2) => _CharacterCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CharacterCopyWith<$R, $In extends Character, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  TierCopyWith<$R, Tier, Tier> get tier;
  DispatchCopyWith<$R, Dispatch, Dispatch> get dispatch;
  $R call({
    String? id,
    String? name,
    String? type,
    String? gender,
    String? side,
    String? ctp,
    String? ctpStatus,
    bool? sixStar,
    bool? update,
    int? shadowland,
    int? infinite,
    int? silence,
    int? burn,
    int? paralyze,
    Tier? tier,
    Dispatch? dispatch,
  });
  CharacterCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CharacterCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Character, $Out>
    implements CharacterCopyWith<$R, Character, $Out> {
  _CharacterCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Character> $mapper =
      CharacterMapper.ensureInitialized();
  @override
  TierCopyWith<$R, Tier, Tier> get tier =>
      $value.tier.copyWith.$chain((v) => call(tier: v));
  @override
  DispatchCopyWith<$R, Dispatch, Dispatch> get dispatch =>
      $value.dispatch.copyWith.$chain((v) => call(dispatch: v));
  @override
  $R call({
    String? id,
    String? name,
    String? type,
    String? gender,
    String? side,
    String? ctp,
    String? ctpStatus,
    bool? sixStar,
    bool? update,
    int? shadowland,
    int? infinite,
    int? silence,
    int? burn,
    int? paralyze,
    Tier? tier,
    Dispatch? dispatch,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != null) #name: name,
      if (type != null) #type: type,
      if (gender != null) #gender: gender,
      if (side != null) #side: side,
      if (ctp != null) #ctp: ctp,
      if (ctpStatus != null) #ctpStatus: ctpStatus,
      if (sixStar != null) #sixStar: sixStar,
      if (update != null) #update: update,
      if (shadowland != null) #shadowland: shadowland,
      if (infinite != null) #infinite: infinite,
      if (silence != null) #silence: silence,
      if (burn != null) #burn: burn,
      if (paralyze != null) #paralyze: paralyze,
      if (tier != null) #tier: tier,
      if (dispatch != null) #dispatch: dispatch,
    }),
  );
  @override
  Character $make(CopyWithData data) => Character(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    type: data.get(#type, or: $value.type),
    gender: data.get(#gender, or: $value.gender),
    side: data.get(#side, or: $value.side),
    ctp: data.get(#ctp, or: $value.ctp),
    ctpStatus: data.get(#ctpStatus, or: $value.ctpStatus),
    sixStar: data.get(#sixStar, or: $value.sixStar),
    update: data.get(#update, or: $value.update),
    shadowland: data.get(#shadowland, or: $value.shadowland),
    infinite: data.get(#infinite, or: $value.infinite),
    silence: data.get(#silence, or: $value.silence),
    burn: data.get(#burn, or: $value.burn),
    paralyze: data.get(#paralyze, or: $value.paralyze),
    tier: data.get(#tier, or: $value.tier),
    dispatch: data.get(#dispatch, or: $value.dispatch),
  );

  @override
  CharacterCopyWith<$R2, Character, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CharacterCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class TierMapper extends ClassMapperBase<Tier> {
  TierMapper._();

  static TierMapper? _instance;
  static TierMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TierMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Tier';

  static String _$value(Tier v) => v.value;
  static const Field<Tier, String> _f$value = Field('value', _$value);
  static int _$level(Tier v) => v.level;
  static const Field<Tier, int> _f$level = Field('level', _$level);

  @override
  final MappableFields<Tier> fields = const {
    #value: _f$value,
    #level: _f$level,
  };

  static Tier _instantiate(DecodingData data) {
    return Tier(value: data.dec(_f$value), level: data.dec(_f$level));
  }

  @override
  final Function instantiate = _instantiate;

  static Tier fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Tier>(map);
  }

  static Tier fromJson(String json) {
    return ensureInitialized().decodeJson<Tier>(json);
  }
}

mixin TierMappable {
  String toJson() {
    return TierMapper.ensureInitialized().encodeJson<Tier>(this as Tier);
  }

  Map<String, dynamic> toMap() {
    return TierMapper.ensureInitialized().encodeMap<Tier>(this as Tier);
  }

  TierCopyWith<Tier, Tier, Tier> get copyWith =>
      _TierCopyWithImpl<Tier, Tier>(this as Tier, $identity, $identity);
  @override
  String toString() {
    return TierMapper.ensureInitialized().stringifyValue(this as Tier);
  }

  @override
  bool operator ==(Object other) {
    return TierMapper.ensureInitialized().equalsValue(this as Tier, other);
  }

  @override
  int get hashCode {
    return TierMapper.ensureInitialized().hashValue(this as Tier);
  }
}

extension TierValueCopy<$R, $Out> on ObjectCopyWith<$R, Tier, $Out> {
  TierCopyWith<$R, Tier, $Out> get $asTier =>
      $base.as((v, t, t2) => _TierCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TierCopyWith<$R, $In extends Tier, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? value, int? level});
  TierCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TierCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Tier, $Out>
    implements TierCopyWith<$R, Tier, $Out> {
  _TierCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Tier> $mapper = TierMapper.ensureInitialized();
  @override
  $R call({String? value, int? level}) => $apply(
    FieldCopyWithData({
      if (value != null) #value: value,
      if (level != null) #level: level,
    }),
  );
  @override
  Tier $make(CopyWithData data) => Tier(
    value: data.get(#value, or: $value.value),
    level: data.get(#level, or: $value.level),
  );

  @override
  TierCopyWith<$R2, Tier, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TierCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class DispatchMapper extends ClassMapperBase<Dispatch> {
  DispatchMapper._();

  static DispatchMapper? _instance;
  static DispatchMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DispatchMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Dispatch';

  static int _$sector(Dispatch v) => v.sector;
  static const Field<Dispatch, int> _f$sector = Field('sector', _$sector);
  static int _$level(Dispatch v) => v.level;
  static const Field<Dispatch, int> _f$level = Field('level', _$level);

  @override
  final MappableFields<Dispatch> fields = const {
    #sector: _f$sector,
    #level: _f$level,
  };

  static Dispatch _instantiate(DecodingData data) {
    return Dispatch(sector: data.dec(_f$sector), level: data.dec(_f$level));
  }

  @override
  final Function instantiate = _instantiate;

  static Dispatch fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Dispatch>(map);
  }

  static Dispatch fromJson(String json) {
    return ensureInitialized().decodeJson<Dispatch>(json);
  }
}

mixin DispatchMappable {
  String toJson() {
    return DispatchMapper.ensureInitialized().encodeJson<Dispatch>(
      this as Dispatch,
    );
  }

  Map<String, dynamic> toMap() {
    return DispatchMapper.ensureInitialized().encodeMap<Dispatch>(
      this as Dispatch,
    );
  }

  DispatchCopyWith<Dispatch, Dispatch, Dispatch> get copyWith =>
      _DispatchCopyWithImpl<Dispatch, Dispatch>(
        this as Dispatch,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return DispatchMapper.ensureInitialized().stringifyValue(this as Dispatch);
  }

  @override
  bool operator ==(Object other) {
    return DispatchMapper.ensureInitialized().equalsValue(
      this as Dispatch,
      other,
    );
  }

  @override
  int get hashCode {
    return DispatchMapper.ensureInitialized().hashValue(this as Dispatch);
  }
}

extension DispatchValueCopy<$R, $Out> on ObjectCopyWith<$R, Dispatch, $Out> {
  DispatchCopyWith<$R, Dispatch, $Out> get $asDispatch =>
      $base.as((v, t, t2) => _DispatchCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DispatchCopyWith<$R, $In extends Dispatch, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? sector, int? level});
  DispatchCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DispatchCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Dispatch, $Out>
    implements DispatchCopyWith<$R, Dispatch, $Out> {
  _DispatchCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Dispatch> $mapper =
      DispatchMapper.ensureInitialized();
  @override
  $R call({int? sector, int? level}) => $apply(
    FieldCopyWithData({
      if (sector != null) #sector: sector,
      if (level != null) #level: level,
    }),
  );
  @override
  Dispatch $make(CopyWithData data) => Dispatch(
    sector: data.get(#sector, or: $value.sector),
    level: data.get(#level, or: $value.level),
  );

  @override
  DispatchCopyWith<$R2, Dispatch, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _DispatchCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

