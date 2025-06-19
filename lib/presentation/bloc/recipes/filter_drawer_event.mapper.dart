// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'filter_drawer_event.dart';

class FilterDrawerEventMapper extends ClassMapperBase<FilterDrawerEvent> {
  FilterDrawerEventMapper._();

  static FilterDrawerEventMapper? _instance;
  static FilterDrawerEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilterDrawerEventMapper._());
      FilterDrawerEventTagQueryChangedMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FilterDrawerEvent';

  @override
  final MappableFields<FilterDrawerEvent> fields = const {};

  static FilterDrawerEvent _instantiate(DecodingData data) {
    throw MapperException.missingSubclass('FilterDrawerEvent', 'event', '${data.value['event']}');
  }

  @override
  final Function instantiate = _instantiate;

  static FilterDrawerEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilterDrawerEvent>(map);
  }

  static FilterDrawerEvent fromJson(String json) {
    return ensureInitialized().decodeJson<FilterDrawerEvent>(json);
  }
}

mixin FilterDrawerEventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  FilterDrawerEventCopyWith<FilterDrawerEvent, FilterDrawerEvent, FilterDrawerEvent> get copyWith;
}

abstract class FilterDrawerEventCopyWith<$R, $In extends FilterDrawerEvent, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  FilterDrawerEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class FilterDrawerEventTagQueryChangedMapper extends SubClassMapperBase<FilterDrawerEventTagQueryChanged> {
  FilterDrawerEventTagQueryChangedMapper._();

  static FilterDrawerEventTagQueryChangedMapper? _instance;
  static FilterDrawerEventTagQueryChangedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilterDrawerEventTagQueryChangedMapper._());
      FilterDrawerEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'FilterDrawerEventTagQueryChanged';

  static String _$tagQuery(FilterDrawerEventTagQueryChanged v) => v.tagQuery;
  static const Field<FilterDrawerEventTagQueryChanged, String> _f$tagQuery = Field('tagQuery', _$tagQuery);

  @override
  final MappableFields<FilterDrawerEventTagQueryChanged> fields = const {
    #tagQuery: _f$tagQuery,
  };

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "tagQueryChanged";
  @override
  late final ClassMapperBase superMapper = FilterDrawerEventMapper.ensureInitialized();

  static FilterDrawerEventTagQueryChanged _instantiate(DecodingData data) {
    return FilterDrawerEventTagQueryChanged(tagQuery: data.dec(_f$tagQuery));
  }

  @override
  final Function instantiate = _instantiate;

  static FilterDrawerEventTagQueryChanged fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilterDrawerEventTagQueryChanged>(map);
  }

  static FilterDrawerEventTagQueryChanged fromJson(String json) {
    return ensureInitialized().decodeJson<FilterDrawerEventTagQueryChanged>(json);
  }
}

mixin FilterDrawerEventTagQueryChangedMappable {
  String toJson() {
    return FilterDrawerEventTagQueryChangedMapper.ensureInitialized().encodeJson<FilterDrawerEventTagQueryChanged>(
      this as FilterDrawerEventTagQueryChanged,
    );
  }

  Map<String, dynamic> toMap() {
    return FilterDrawerEventTagQueryChangedMapper.ensureInitialized().encodeMap<FilterDrawerEventTagQueryChanged>(
      this as FilterDrawerEventTagQueryChanged,
    );
  }

  FilterDrawerEventTagQueryChangedCopyWith<
    FilterDrawerEventTagQueryChanged,
    FilterDrawerEventTagQueryChanged,
    FilterDrawerEventTagQueryChanged
  >
  get copyWith =>
      _FilterDrawerEventTagQueryChangedCopyWithImpl<FilterDrawerEventTagQueryChanged, FilterDrawerEventTagQueryChanged>(
        this as FilterDrawerEventTagQueryChanged,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return FilterDrawerEventTagQueryChangedMapper.ensureInitialized().stringifyValue(
      this as FilterDrawerEventTagQueryChanged,
    );
  }

  @override
  bool operator ==(Object other) {
    return FilterDrawerEventTagQueryChangedMapper.ensureInitialized().equalsValue(
      this as FilterDrawerEventTagQueryChanged,
      other,
    );
  }

  @override
  int get hashCode {
    return FilterDrawerEventTagQueryChangedMapper.ensureInitialized().hashValue(
      this as FilterDrawerEventTagQueryChanged,
    );
  }
}

extension FilterDrawerEventTagQueryChangedValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FilterDrawerEventTagQueryChanged, $Out> {
  FilterDrawerEventTagQueryChangedCopyWith<$R, FilterDrawerEventTagQueryChanged, $Out>
  get $asFilterDrawerEventTagQueryChanged =>
      $base.as((v, t, t2) => _FilterDrawerEventTagQueryChangedCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FilterDrawerEventTagQueryChangedCopyWith<$R, $In extends FilterDrawerEventTagQueryChanged, $Out>
    implements FilterDrawerEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? tagQuery});
  FilterDrawerEventTagQueryChangedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FilterDrawerEventTagQueryChangedCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FilterDrawerEventTagQueryChanged, $Out>
    implements FilterDrawerEventTagQueryChangedCopyWith<$R, FilterDrawerEventTagQueryChanged, $Out> {
  _FilterDrawerEventTagQueryChangedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilterDrawerEventTagQueryChanged> $mapper =
      FilterDrawerEventTagQueryChangedMapper.ensureInitialized();
  @override
  $R call({String? tagQuery}) => $apply(FieldCopyWithData({if (tagQuery != null) #tagQuery: tagQuery}));
  @override
  FilterDrawerEventTagQueryChanged $make(CopyWithData data) =>
      FilterDrawerEventTagQueryChanged(tagQuery: data.get(#tagQuery, or: $value.tagQuery));

  @override
  FilterDrawerEventTagQueryChangedCopyWith<$R2, FilterDrawerEventTagQueryChanged, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _FilterDrawerEventTagQueryChangedCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
