// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'filter_entity.dart';

class FilterEntityMapper extends ClassMapperBase<FilterEntity> {
  FilterEntityMapper._();

  static FilterEntityMapper? _instance;
  static FilterEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilterEntityMapper._());
      DifficultyEntityMapper.ensureInitialized();
      TagEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FilterEntity';

  static int? _$ratingMin(FilterEntity v) => v.ratingMin;
  static const Field<FilterEntity, int> _f$ratingMin = Field('ratingMin', _$ratingMin, opt: true);
  static int? _$timeMin(FilterEntity v) => v.timeMin;
  static const Field<FilterEntity, int> _f$timeMin = Field('timeMin', _$timeMin, opt: true);
  static int? _$timeMax(FilterEntity v) => v.timeMax;
  static const Field<FilterEntity, int> _f$timeMax = Field('timeMax', _$timeMax, opt: true);
  static int? _$servingsMin(FilterEntity v) => v.servingsMin;
  static const Field<FilterEntity, int> _f$servingsMin = Field('servingsMin', _$servingsMin, opt: true);
  static int? _$servingsMax(FilterEntity v) => v.servingsMax;
  static const Field<FilterEntity, int> _f$servingsMax = Field('servingsMax', _$servingsMax, opt: true);
  static Set<DifficultyEntity> _$difficulties(FilterEntity v) => v.difficulties;
  static const Field<FilterEntity, Set<DifficultyEntity>> _f$difficulties = Field(
    'difficulties',
    _$difficulties,
    opt: true,
    def: const {},
  );
  static Set<TagEntity> _$tags(FilterEntity v) => v.tags;
  static const Field<FilterEntity, Set<TagEntity>> _f$tags = Field('tags', _$tags, opt: true, def: const {});

  @override
  final MappableFields<FilterEntity> fields = const {
    #ratingMin: _f$ratingMin,
    #timeMin: _f$timeMin,
    #timeMax: _f$timeMax,
    #servingsMin: _f$servingsMin,
    #servingsMax: _f$servingsMax,
    #difficulties: _f$difficulties,
    #tags: _f$tags,
  };

  static FilterEntity _instantiate(DecodingData data) {
    return FilterEntity(
      ratingMin: data.dec(_f$ratingMin),
      timeMin: data.dec(_f$timeMin),
      timeMax: data.dec(_f$timeMax),
      servingsMin: data.dec(_f$servingsMin),
      servingsMax: data.dec(_f$servingsMax),
      difficulties: data.dec(_f$difficulties),
      tags: data.dec(_f$tags),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static FilterEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilterEntity>(map);
  }

  static FilterEntity fromJson(String json) {
    return ensureInitialized().decodeJson<FilterEntity>(json);
  }
}

mixin FilterEntityMappable {
  String toJson() {
    return FilterEntityMapper.ensureInitialized().encodeJson<FilterEntity>(this as FilterEntity);
  }

  Map<String, dynamic> toMap() {
    return FilterEntityMapper.ensureInitialized().encodeMap<FilterEntity>(this as FilterEntity);
  }

  FilterEntityCopyWith<FilterEntity, FilterEntity, FilterEntity> get copyWith =>
      _FilterEntityCopyWithImpl<FilterEntity, FilterEntity>(this as FilterEntity, $identity, $identity);
  @override
  String toString() {
    return FilterEntityMapper.ensureInitialized().stringifyValue(this as FilterEntity);
  }

  @override
  bool operator ==(Object other) {
    return FilterEntityMapper.ensureInitialized().equalsValue(this as FilterEntity, other);
  }

  @override
  int get hashCode {
    return FilterEntityMapper.ensureInitialized().hashValue(this as FilterEntity);
  }
}

extension FilterEntityValueCopy<$R, $Out> on ObjectCopyWith<$R, FilterEntity, $Out> {
  FilterEntityCopyWith<$R, FilterEntity, $Out> get $asFilterEntity =>
      $base.as((v, t, t2) => _FilterEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FilterEntityCopyWith<$R, $In extends FilterEntity, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? ratingMin,
    int? timeMin,
    int? timeMax,
    int? servingsMin,
    int? servingsMax,
    Set<DifficultyEntity>? difficulties,
    Set<TagEntity>? tags,
  });
  FilterEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FilterEntityCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, FilterEntity, $Out>
    implements FilterEntityCopyWith<$R, FilterEntity, $Out> {
  _FilterEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilterEntity> $mapper = FilterEntityMapper.ensureInitialized();
  @override
  $R call({
    Object? ratingMin = $none,
    Object? timeMin = $none,
    Object? timeMax = $none,
    Object? servingsMin = $none,
    Object? servingsMax = $none,
    Set<DifficultyEntity>? difficulties,
    Set<TagEntity>? tags,
  }) => $apply(
    FieldCopyWithData({
      if (ratingMin != $none) #ratingMin: ratingMin,
      if (timeMin != $none) #timeMin: timeMin,
      if (timeMax != $none) #timeMax: timeMax,
      if (servingsMin != $none) #servingsMin: servingsMin,
      if (servingsMax != $none) #servingsMax: servingsMax,
      if (difficulties != null) #difficulties: difficulties,
      if (tags != null) #tags: tags,
    }),
  );
  @override
  FilterEntity $make(CopyWithData data) => FilterEntity(
    ratingMin: data.get(#ratingMin, or: $value.ratingMin),
    timeMin: data.get(#timeMin, or: $value.timeMin),
    timeMax: data.get(#timeMax, or: $value.timeMax),
    servingsMin: data.get(#servingsMin, or: $value.servingsMin),
    servingsMax: data.get(#servingsMax, or: $value.servingsMax),
    difficulties: data.get(#difficulties, or: $value.difficulties),
    tags: data.get(#tags, or: $value.tags),
  );

  @override
  FilterEntityCopyWith<$R2, FilterEntity, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FilterEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
