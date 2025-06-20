// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'filter_model.dart';

class FilterModelMapper extends ClassMapperBase<FilterModel> {
  FilterModelMapper._();

  static FilterModelMapper? _instance;
  static FilterModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilterModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FilterModel';

  static int? _$ratingMin(FilterModel v) => v.ratingMin;
  static const Field<FilterModel, int> _f$ratingMin = Field('ratingMin', _$ratingMin, opt: true);
  static int? _$timeMin(FilterModel v) => v.timeMin;
  static const Field<FilterModel, int> _f$timeMin = Field('timeMin', _$timeMin, opt: true);
  static int? _$timeMax(FilterModel v) => v.timeMax;
  static const Field<FilterModel, int> _f$timeMax = Field('timeMax', _$timeMax, opt: true);
  static int? _$servingsMin(FilterModel v) => v.servingsMin;
  static const Field<FilterModel, int> _f$servingsMin = Field('servingsMin', _$servingsMin, opt: true);
  static int? _$servingsMax(FilterModel v) => v.servingsMax;
  static const Field<FilterModel, int> _f$servingsMax = Field('servingsMax', _$servingsMax, opt: true);
  static Set<int> _$difficulties(FilterModel v) => v.difficulties;
  static const Field<FilterModel, Set<int>> _f$difficulties = Field(
    'difficulties',
    _$difficulties,
    opt: true,
    def: const {},
  );
  static Set<int> _$tags(FilterModel v) => v.tags;
  static const Field<FilterModel, Set<int>> _f$tags = Field('tags', _$tags, opt: true, def: const {});

  @override
  final MappableFields<FilterModel> fields = const {
    #ratingMin: _f$ratingMin,
    #timeMin: _f$timeMin,
    #timeMax: _f$timeMax,
    #servingsMin: _f$servingsMin,
    #servingsMax: _f$servingsMax,
    #difficulties: _f$difficulties,
    #tags: _f$tags,
  };

  static FilterModel _instantiate(DecodingData data) {
    return FilterModel(
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

  static FilterModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilterModel>(map);
  }

  static FilterModel fromJson(String json) {
    return ensureInitialized().decodeJson<FilterModel>(json);
  }
}

mixin FilterModelMappable {
  String toJson() {
    return FilterModelMapper.ensureInitialized().encodeJson<FilterModel>(this as FilterModel);
  }

  Map<String, dynamic> toMap() {
    return FilterModelMapper.ensureInitialized().encodeMap<FilterModel>(this as FilterModel);
  }

  FilterModelCopyWith<FilterModel, FilterModel, FilterModel> get copyWith =>
      _FilterModelCopyWithImpl<FilterModel, FilterModel>(this as FilterModel, $identity, $identity);
  @override
  String toString() {
    return FilterModelMapper.ensureInitialized().stringifyValue(this as FilterModel);
  }

  @override
  bool operator ==(Object other) {
    return FilterModelMapper.ensureInitialized().equalsValue(this as FilterModel, other);
  }

  @override
  int get hashCode {
    return FilterModelMapper.ensureInitialized().hashValue(this as FilterModel);
  }
}

extension FilterModelValueCopy<$R, $Out> on ObjectCopyWith<$R, FilterModel, $Out> {
  FilterModelCopyWith<$R, FilterModel, $Out> get $asFilterModel =>
      $base.as((v, t, t2) => _FilterModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FilterModelCopyWith<$R, $In extends FilterModel, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? ratingMin,
    int? timeMin,
    int? timeMax,
    int? servingsMin,
    int? servingsMax,
    Set<int>? difficulties,
    Set<int>? tags,
  });
  FilterModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FilterModelCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, FilterModel, $Out>
    implements FilterModelCopyWith<$R, FilterModel, $Out> {
  _FilterModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilterModel> $mapper = FilterModelMapper.ensureInitialized();
  @override
  $R call({
    Object? ratingMin = $none,
    Object? timeMin = $none,
    Object? timeMax = $none,
    Object? servingsMin = $none,
    Object? servingsMax = $none,
    Set<int>? difficulties,
    Set<int>? tags,
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
  FilterModel $make(CopyWithData data) => FilterModel(
    ratingMin: data.get(#ratingMin, or: $value.ratingMin),
    timeMin: data.get(#timeMin, or: $value.timeMin),
    timeMax: data.get(#timeMax, or: $value.timeMax),
    servingsMin: data.get(#servingsMin, or: $value.servingsMin),
    servingsMax: data.get(#servingsMax, or: $value.servingsMax),
    difficulties: data.get(#difficulties, or: $value.difficulties),
    tags: data.get(#tags, or: $value.tags),
  );

  @override
  FilterModelCopyWith<$R2, FilterModel, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FilterModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
