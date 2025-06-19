// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'recipes_event.dart';

class RecipesEventMapper extends ClassMapperBase<RecipesEvent> {
  RecipesEventMapper._();

  static RecipesEventMapper? _instance;
  static RecipesEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesEventMapper._());
      RecipesEventLoadMapper.ensureInitialized();
      RecipesEventSearchMapper.ensureInitialized();
      RecipesEventFilterMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RecipesEvent';

  @override
  final MappableFields<RecipesEvent> fields = const {};

  static RecipesEvent _instantiate(DecodingData data) {
    throw MapperException.missingSubclass('RecipesEvent', 'event', '${data.value['event']}');
  }

  @override
  final Function instantiate = _instantiate;

  static RecipesEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipesEvent>(map);
  }

  static RecipesEvent fromJson(String json) {
    return ensureInitialized().decodeJson<RecipesEvent>(json);
  }
}

mixin RecipesEventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  RecipesEventCopyWith<RecipesEvent, RecipesEvent, RecipesEvent> get copyWith;
}

abstract class RecipesEventCopyWith<$R, $In extends RecipesEvent, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  RecipesEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class RecipesEventLoadMapper extends SubClassMapperBase<RecipesEventLoad> {
  RecipesEventLoadMapper._();

  static RecipesEventLoadMapper? _instance;
  static RecipesEventLoadMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesEventLoadMapper._());
      RecipesEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'RecipesEventLoad';

  @override
  final MappableFields<RecipesEventLoad> fields = const {};

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "load";
  @override
  late final ClassMapperBase superMapper = RecipesEventMapper.ensureInitialized();

  static RecipesEventLoad _instantiate(DecodingData data) {
    return RecipesEventLoad();
  }

  @override
  final Function instantiate = _instantiate;

  static RecipesEventLoad fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipesEventLoad>(map);
  }

  static RecipesEventLoad fromJson(String json) {
    return ensureInitialized().decodeJson<RecipesEventLoad>(json);
  }
}

mixin RecipesEventLoadMappable {
  String toJson() {
    return RecipesEventLoadMapper.ensureInitialized().encodeJson<RecipesEventLoad>(this as RecipesEventLoad);
  }

  Map<String, dynamic> toMap() {
    return RecipesEventLoadMapper.ensureInitialized().encodeMap<RecipesEventLoad>(this as RecipesEventLoad);
  }

  RecipesEventLoadCopyWith<RecipesEventLoad, RecipesEventLoad, RecipesEventLoad> get copyWith =>
      _RecipesEventLoadCopyWithImpl<RecipesEventLoad, RecipesEventLoad>(this as RecipesEventLoad, $identity, $identity);
  @override
  String toString() {
    return RecipesEventLoadMapper.ensureInitialized().stringifyValue(this as RecipesEventLoad);
  }

  @override
  bool operator ==(Object other) {
    return RecipesEventLoadMapper.ensureInitialized().equalsValue(this as RecipesEventLoad, other);
  }

  @override
  int get hashCode {
    return RecipesEventLoadMapper.ensureInitialized().hashValue(this as RecipesEventLoad);
  }
}

extension RecipesEventLoadValueCopy<$R, $Out> on ObjectCopyWith<$R, RecipesEventLoad, $Out> {
  RecipesEventLoadCopyWith<$R, RecipesEventLoad, $Out> get $asRecipesEventLoad =>
      $base.as((v, t, t2) => _RecipesEventLoadCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipesEventLoadCopyWith<$R, $In extends RecipesEventLoad, $Out>
    implements RecipesEventCopyWith<$R, $In, $Out> {
  @override
  $R call();
  RecipesEventLoadCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipesEventLoadCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RecipesEventLoad, $Out>
    implements RecipesEventLoadCopyWith<$R, RecipesEventLoad, $Out> {
  _RecipesEventLoadCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipesEventLoad> $mapper = RecipesEventLoadMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  RecipesEventLoad $make(CopyWithData data) => RecipesEventLoad();

  @override
  RecipesEventLoadCopyWith<$R2, RecipesEventLoad, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipesEventLoadCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RecipesEventSearchMapper extends SubClassMapperBase<RecipesEventSearch> {
  RecipesEventSearchMapper._();

  static RecipesEventSearchMapper? _instance;
  static RecipesEventSearchMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesEventSearchMapper._());
      RecipesEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'RecipesEventSearch';

  static String _$searchQuery(RecipesEventSearch v) => v.searchQuery;
  static const Field<RecipesEventSearch, String> _f$searchQuery = Field('searchQuery', _$searchQuery);

  @override
  final MappableFields<RecipesEventSearch> fields = const {
    #searchQuery: _f$searchQuery,
  };

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "search";
  @override
  late final ClassMapperBase superMapper = RecipesEventMapper.ensureInitialized();

  static RecipesEventSearch _instantiate(DecodingData data) {
    return RecipesEventSearch(searchQuery: data.dec(_f$searchQuery));
  }

  @override
  final Function instantiate = _instantiate;

  static RecipesEventSearch fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipesEventSearch>(map);
  }

  static RecipesEventSearch fromJson(String json) {
    return ensureInitialized().decodeJson<RecipesEventSearch>(json);
  }
}

mixin RecipesEventSearchMappable {
  String toJson() {
    return RecipesEventSearchMapper.ensureInitialized().encodeJson<RecipesEventSearch>(this as RecipesEventSearch);
  }

  Map<String, dynamic> toMap() {
    return RecipesEventSearchMapper.ensureInitialized().encodeMap<RecipesEventSearch>(this as RecipesEventSearch);
  }

  RecipesEventSearchCopyWith<RecipesEventSearch, RecipesEventSearch, RecipesEventSearch> get copyWith =>
      _RecipesEventSearchCopyWithImpl<RecipesEventSearch, RecipesEventSearch>(
        this as RecipesEventSearch,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RecipesEventSearchMapper.ensureInitialized().stringifyValue(this as RecipesEventSearch);
  }

  @override
  bool operator ==(Object other) {
    return RecipesEventSearchMapper.ensureInitialized().equalsValue(this as RecipesEventSearch, other);
  }

  @override
  int get hashCode {
    return RecipesEventSearchMapper.ensureInitialized().hashValue(this as RecipesEventSearch);
  }
}

extension RecipesEventSearchValueCopy<$R, $Out> on ObjectCopyWith<$R, RecipesEventSearch, $Out> {
  RecipesEventSearchCopyWith<$R, RecipesEventSearch, $Out> get $asRecipesEventSearch =>
      $base.as((v, t, t2) => _RecipesEventSearchCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipesEventSearchCopyWith<$R, $In extends RecipesEventSearch, $Out>
    implements RecipesEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? searchQuery});
  RecipesEventSearchCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipesEventSearchCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RecipesEventSearch, $Out>
    implements RecipesEventSearchCopyWith<$R, RecipesEventSearch, $Out> {
  _RecipesEventSearchCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipesEventSearch> $mapper = RecipesEventSearchMapper.ensureInitialized();
  @override
  $R call({String? searchQuery}) => $apply(FieldCopyWithData({if (searchQuery != null) #searchQuery: searchQuery}));
  @override
  RecipesEventSearch $make(CopyWithData data) =>
      RecipesEventSearch(searchQuery: data.get(#searchQuery, or: $value.searchQuery));

  @override
  RecipesEventSearchCopyWith<$R2, RecipesEventSearch, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipesEventSearchCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RecipesEventFilterMapper extends SubClassMapperBase<RecipesEventFilter> {
  RecipesEventFilterMapper._();

  static RecipesEventFilterMapper? _instance;
  static RecipesEventFilterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesEventFilterMapper._());
      RecipesEventMapper.ensureInitialized().addSubMapper(_instance!);
      SortEntityMapper.ensureInitialized();
      FilterEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RecipesEventFilter';

  static SortEntity _$sort(RecipesEventFilter v) => v.sort;
  static const Field<RecipesEventFilter, SortEntity> _f$sort = Field('sort', _$sort);
  static FilterEntity _$filter(RecipesEventFilter v) => v.filter;
  static const Field<RecipesEventFilter, FilterEntity> _f$filter = Field('filter', _$filter);

  @override
  final MappableFields<RecipesEventFilter> fields = const {
    #sort: _f$sort,
    #filter: _f$filter,
  };

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "filter";
  @override
  late final ClassMapperBase superMapper = RecipesEventMapper.ensureInitialized();

  static RecipesEventFilter _instantiate(DecodingData data) {
    return RecipesEventFilter(sort: data.dec(_f$sort), filter: data.dec(_f$filter));
  }

  @override
  final Function instantiate = _instantiate;

  static RecipesEventFilter fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipesEventFilter>(map);
  }

  static RecipesEventFilter fromJson(String json) {
    return ensureInitialized().decodeJson<RecipesEventFilter>(json);
  }
}

mixin RecipesEventFilterMappable {
  String toJson() {
    return RecipesEventFilterMapper.ensureInitialized().encodeJson<RecipesEventFilter>(this as RecipesEventFilter);
  }

  Map<String, dynamic> toMap() {
    return RecipesEventFilterMapper.ensureInitialized().encodeMap<RecipesEventFilter>(this as RecipesEventFilter);
  }

  RecipesEventFilterCopyWith<RecipesEventFilter, RecipesEventFilter, RecipesEventFilter> get copyWith =>
      _RecipesEventFilterCopyWithImpl<RecipesEventFilter, RecipesEventFilter>(
        this as RecipesEventFilter,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RecipesEventFilterMapper.ensureInitialized().stringifyValue(this as RecipesEventFilter);
  }

  @override
  bool operator ==(Object other) {
    return RecipesEventFilterMapper.ensureInitialized().equalsValue(this as RecipesEventFilter, other);
  }

  @override
  int get hashCode {
    return RecipesEventFilterMapper.ensureInitialized().hashValue(this as RecipesEventFilter);
  }
}

extension RecipesEventFilterValueCopy<$R, $Out> on ObjectCopyWith<$R, RecipesEventFilter, $Out> {
  RecipesEventFilterCopyWith<$R, RecipesEventFilter, $Out> get $asRecipesEventFilter =>
      $base.as((v, t, t2) => _RecipesEventFilterCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipesEventFilterCopyWith<$R, $In extends RecipesEventFilter, $Out>
    implements RecipesEventCopyWith<$R, $In, $Out> {
  FilterEntityCopyWith<$R, FilterEntity, FilterEntity> get filter;
  @override
  $R call({SortEntity? sort, FilterEntity? filter});
  RecipesEventFilterCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipesEventFilterCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RecipesEventFilter, $Out>
    implements RecipesEventFilterCopyWith<$R, RecipesEventFilter, $Out> {
  _RecipesEventFilterCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipesEventFilter> $mapper = RecipesEventFilterMapper.ensureInitialized();
  @override
  FilterEntityCopyWith<$R, FilterEntity, FilterEntity> get filter =>
      $value.filter.copyWith.$chain((v) => call(filter: v));
  @override
  $R call({SortEntity? sort, FilterEntity? filter}) =>
      $apply(FieldCopyWithData({if (sort != null) #sort: sort, if (filter != null) #filter: filter}));
  @override
  RecipesEventFilter $make(CopyWithData data) => RecipesEventFilter(
    sort: data.get(#sort, or: $value.sort),
    filter: data.get(#filter, or: $value.filter),
  );

  @override
  RecipesEventFilterCopyWith<$R2, RecipesEventFilter, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipesEventFilterCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
