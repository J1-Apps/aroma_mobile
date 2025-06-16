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
    }
    return _instance!;
  }

  @override
  final String id = 'FilterEntity';

  static int? _$timeMin(FilterEntity v) => v.timeMin;
  static const Field<FilterEntity, int> _f$timeMin = Field('timeMin', _$timeMin);
  static int? _$timeMax(FilterEntity v) => v.timeMax;
  static const Field<FilterEntity, int> _f$timeMax = Field('timeMax', _$timeMax);
  static int? _$ratingMin(FilterEntity v) => v.ratingMin;
  static const Field<FilterEntity, int> _f$ratingMin = Field('ratingMin', _$ratingMin);
  static int? _$ratingMax(FilterEntity v) => v.ratingMax;
  static const Field<FilterEntity, int> _f$ratingMax = Field('ratingMax', _$ratingMax);
  static int? _$difficultyMin(FilterEntity v) => v.difficultyMin;
  static const Field<FilterEntity, int> _f$difficultyMin = Field('difficultyMin', _$difficultyMin);
  static int? _$difficultyMax(FilterEntity v) => v.difficultyMax;
  static const Field<FilterEntity, int> _f$difficultyMax = Field('difficultyMax', _$difficultyMax);
  static List<int> _$tags(FilterEntity v) => v.tags;
  static const Field<FilterEntity, List<int>> _f$tags = Field('tags', _$tags);

  @override
  final MappableFields<FilterEntity> fields = const {
    #timeMin: _f$timeMin,
    #timeMax: _f$timeMax,
    #ratingMin: _f$ratingMin,
    #ratingMax: _f$ratingMax,
    #difficultyMin: _f$difficultyMin,
    #difficultyMax: _f$difficultyMax,
    #tags: _f$tags,
  };

  static FilterEntity _instantiate(DecodingData data) {
    return FilterEntity(
      timeMin: data.dec(_f$timeMin),
      timeMax: data.dec(_f$timeMax),
      ratingMin: data.dec(_f$ratingMin),
      ratingMax: data.dec(_f$ratingMax),
      difficultyMin: data.dec(_f$difficultyMin),
      difficultyMax: data.dec(_f$difficultyMax),
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
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get tags;
  $R call({
    int? timeMin,
    int? timeMax,
    int? ratingMin,
    int? ratingMax,
    int? difficultyMin,
    int? difficultyMax,
    List<int>? tags,
  });
  FilterEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FilterEntityCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, FilterEntity, $Out>
    implements FilterEntityCopyWith<$R, FilterEntity, $Out> {
  _FilterEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilterEntity> $mapper = FilterEntityMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get tags =>
      ListCopyWith($value.tags, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(tags: v));
  @override
  $R call({
    Object? timeMin = $none,
    Object? timeMax = $none,
    Object? ratingMin = $none,
    Object? ratingMax = $none,
    Object? difficultyMin = $none,
    Object? difficultyMax = $none,
    List<int>? tags,
  }) => $apply(
    FieldCopyWithData({
      if (timeMin != $none) #timeMin: timeMin,
      if (timeMax != $none) #timeMax: timeMax,
      if (ratingMin != $none) #ratingMin: ratingMin,
      if (ratingMax != $none) #ratingMax: ratingMax,
      if (difficultyMin != $none) #difficultyMin: difficultyMin,
      if (difficultyMax != $none) #difficultyMax: difficultyMax,
      if (tags != null) #tags: tags,
    }),
  );
  @override
  FilterEntity $make(CopyWithData data) => FilterEntity(
    timeMin: data.get(#timeMin, or: $value.timeMin),
    timeMax: data.get(#timeMax, or: $value.timeMax),
    ratingMin: data.get(#ratingMin, or: $value.ratingMin),
    ratingMax: data.get(#ratingMax, or: $value.ratingMax),
    difficultyMin: data.get(#difficultyMin, or: $value.difficultyMin),
    difficultyMax: data.get(#difficultyMax, or: $value.difficultyMax),
    tags: data.get(#tags, or: $value.tags),
  );

  @override
  FilterEntityCopyWith<$R2, FilterEntity, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FilterEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
