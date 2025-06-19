// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'filter_drawer_state.dart';

class TagStatusMapper extends EnumMapper<TagStatus> {
  TagStatusMapper._();

  static TagStatusMapper? _instance;
  static TagStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TagStatusMapper._());
    }
    return _instance!;
  }

  static TagStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TagStatus decode(dynamic value) {
    switch (value) {
      case r'loading':
        return TagStatus.loading;
      case r'empty':
        return TagStatus.empty;
      case r'success':
        return TagStatus.success;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TagStatus self) {
    switch (self) {
      case TagStatus.loading:
        return r'loading';
      case TagStatus.empty:
        return r'empty';
      case TagStatus.success:
        return r'success';
    }
  }
}

extension TagStatusMapperExtension on TagStatus {
  String toValue() {
    TagStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TagStatus>(this) as String;
  }
}

class FilterDrawerStateMapper extends ClassMapperBase<FilterDrawerState> {
  FilterDrawerStateMapper._();

  static FilterDrawerStateMapper? _instance;
  static FilterDrawerStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilterDrawerStateMapper._());
      TagStatusMapper.ensureInitialized();
      TagEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FilterDrawerState';

  static TagStatus _$tagStatus(FilterDrawerState v) => v.tagStatus;
  static const Field<FilterDrawerState, TagStatus> _f$tagStatus = Field('tagStatus', _$tagStatus);
  static List<TagEntity> _$tagResults(FilterDrawerState v) => v.tagResults;
  static const Field<FilterDrawerState, List<TagEntity>> _f$tagResults = Field('tagResults', _$tagResults);

  @override
  final MappableFields<FilterDrawerState> fields = const {
    #tagStatus: _f$tagStatus,
    #tagResults: _f$tagResults,
  };

  static FilterDrawerState _instantiate(DecodingData data) {
    return FilterDrawerState(tagStatus: data.dec(_f$tagStatus), tagResults: data.dec(_f$tagResults));
  }

  @override
  final Function instantiate = _instantiate;

  static FilterDrawerState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilterDrawerState>(map);
  }

  static FilterDrawerState fromJson(String json) {
    return ensureInitialized().decodeJson<FilterDrawerState>(json);
  }
}

mixin FilterDrawerStateMappable {
  String toJson() {
    return FilterDrawerStateMapper.ensureInitialized().encodeJson<FilterDrawerState>(this as FilterDrawerState);
  }

  Map<String, dynamic> toMap() {
    return FilterDrawerStateMapper.ensureInitialized().encodeMap<FilterDrawerState>(this as FilterDrawerState);
  }

  FilterDrawerStateCopyWith<FilterDrawerState, FilterDrawerState, FilterDrawerState> get copyWith =>
      _FilterDrawerStateCopyWithImpl<FilterDrawerState, FilterDrawerState>(
        this as FilterDrawerState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return FilterDrawerStateMapper.ensureInitialized().stringifyValue(this as FilterDrawerState);
  }

  @override
  bool operator ==(Object other) {
    return FilterDrawerStateMapper.ensureInitialized().equalsValue(this as FilterDrawerState, other);
  }

  @override
  int get hashCode {
    return FilterDrawerStateMapper.ensureInitialized().hashValue(this as FilterDrawerState);
  }
}

extension FilterDrawerStateValueCopy<$R, $Out> on ObjectCopyWith<$R, FilterDrawerState, $Out> {
  FilterDrawerStateCopyWith<$R, FilterDrawerState, $Out> get $asFilterDrawerState =>
      $base.as((v, t, t2) => _FilterDrawerStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FilterDrawerStateCopyWith<$R, $In extends FilterDrawerState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, TagEntity, TagEntityCopyWith<$R, TagEntity, TagEntity>> get tagResults;
  $R call({TagStatus? tagStatus, List<TagEntity>? tagResults});
  FilterDrawerStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FilterDrawerStateCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, FilterDrawerState, $Out>
    implements FilterDrawerStateCopyWith<$R, FilterDrawerState, $Out> {
  _FilterDrawerStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilterDrawerState> $mapper = FilterDrawerStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, TagEntity, TagEntityCopyWith<$R, TagEntity, TagEntity>> get tagResults =>
      ListCopyWith($value.tagResults, (v, t) => v.copyWith.$chain(t), (v) => call(tagResults: v));
  @override
  $R call({TagStatus? tagStatus, List<TagEntity>? tagResults}) => $apply(
    FieldCopyWithData({if (tagStatus != null) #tagStatus: tagStatus, if (tagResults != null) #tagResults: tagResults}),
  );
  @override
  FilterDrawerState $make(CopyWithData data) => FilterDrawerState(
    tagStatus: data.get(#tagStatus, or: $value.tagStatus),
    tagResults: data.get(#tagResults, or: $value.tagResults),
  );

  @override
  FilterDrawerStateCopyWith<$R2, FilterDrawerState, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FilterDrawerStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
