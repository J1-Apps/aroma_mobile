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
      RecipesEventResetFilterMapper.ensureInitialized();
      RecipesEventUpdateSortMapper.ensureInitialized();
      RecipesEventUpdateRatingMinMapper.ensureInitialized();
      RecipesEventUpdateTimeMapper.ensureInitialized();
      RecipesEventUpdateServingsMapper.ensureInitialized();
      RecipesEventUpdateDifficultyMapper.ensureInitialized();
      RecipesEventUpdateTagsMapper.ensureInitialized();
      RecipesEventToggleSelectedMapper.ensureInitialized();
      RecipesEventDeleteSelectedMapper.ensureInitialized();
      RecipesEventResetSelectedMapper.ensureInitialized();
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

class RecipesEventResetFilterMapper extends SubClassMapperBase<RecipesEventResetFilter> {
  RecipesEventResetFilterMapper._();

  static RecipesEventResetFilterMapper? _instance;
  static RecipesEventResetFilterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesEventResetFilterMapper._());
      RecipesEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'RecipesEventResetFilter';

  @override
  final MappableFields<RecipesEventResetFilter> fields = const {};

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "reset_filter";
  @override
  late final ClassMapperBase superMapper = RecipesEventMapper.ensureInitialized();

  static RecipesEventResetFilter _instantiate(DecodingData data) {
    return RecipesEventResetFilter();
  }

  @override
  final Function instantiate = _instantiate;

  static RecipesEventResetFilter fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipesEventResetFilter>(map);
  }

  static RecipesEventResetFilter fromJson(String json) {
    return ensureInitialized().decodeJson<RecipesEventResetFilter>(json);
  }
}

mixin RecipesEventResetFilterMappable {
  String toJson() {
    return RecipesEventResetFilterMapper.ensureInitialized().encodeJson<RecipesEventResetFilter>(
      this as RecipesEventResetFilter,
    );
  }

  Map<String, dynamic> toMap() {
    return RecipesEventResetFilterMapper.ensureInitialized().encodeMap<RecipesEventResetFilter>(
      this as RecipesEventResetFilter,
    );
  }

  RecipesEventResetFilterCopyWith<RecipesEventResetFilter, RecipesEventResetFilter, RecipesEventResetFilter>
  get copyWith => _RecipesEventResetFilterCopyWithImpl<RecipesEventResetFilter, RecipesEventResetFilter>(
    this as RecipesEventResetFilter,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return RecipesEventResetFilterMapper.ensureInitialized().stringifyValue(this as RecipesEventResetFilter);
  }

  @override
  bool operator ==(Object other) {
    return RecipesEventResetFilterMapper.ensureInitialized().equalsValue(this as RecipesEventResetFilter, other);
  }

  @override
  int get hashCode {
    return RecipesEventResetFilterMapper.ensureInitialized().hashValue(this as RecipesEventResetFilter);
  }
}

extension RecipesEventResetFilterValueCopy<$R, $Out> on ObjectCopyWith<$R, RecipesEventResetFilter, $Out> {
  RecipesEventResetFilterCopyWith<$R, RecipesEventResetFilter, $Out> get $asRecipesEventResetFilter =>
      $base.as((v, t, t2) => _RecipesEventResetFilterCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipesEventResetFilterCopyWith<$R, $In extends RecipesEventResetFilter, $Out>
    implements RecipesEventCopyWith<$R, $In, $Out> {
  @override
  $R call();
  RecipesEventResetFilterCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipesEventResetFilterCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RecipesEventResetFilter, $Out>
    implements RecipesEventResetFilterCopyWith<$R, RecipesEventResetFilter, $Out> {
  _RecipesEventResetFilterCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipesEventResetFilter> $mapper = RecipesEventResetFilterMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  RecipesEventResetFilter $make(CopyWithData data) => RecipesEventResetFilter();

  @override
  RecipesEventResetFilterCopyWith<$R2, RecipesEventResetFilter, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipesEventResetFilterCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RecipesEventUpdateSortMapper extends SubClassMapperBase<RecipesEventUpdateSort> {
  RecipesEventUpdateSortMapper._();

  static RecipesEventUpdateSortMapper? _instance;
  static RecipesEventUpdateSortMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesEventUpdateSortMapper._());
      RecipesEventMapper.ensureInitialized().addSubMapper(_instance!);
      SortEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RecipesEventUpdateSort';

  static SortEntity _$sort(RecipesEventUpdateSort v) => v.sort;
  static const Field<RecipesEventUpdateSort, SortEntity> _f$sort = Field('sort', _$sort);

  @override
  final MappableFields<RecipesEventUpdateSort> fields = const {
    #sort: _f$sort,
  };

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "update_sort";
  @override
  late final ClassMapperBase superMapper = RecipesEventMapper.ensureInitialized();

  static RecipesEventUpdateSort _instantiate(DecodingData data) {
    return RecipesEventUpdateSort(sort: data.dec(_f$sort));
  }

  @override
  final Function instantiate = _instantiate;

  static RecipesEventUpdateSort fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipesEventUpdateSort>(map);
  }

  static RecipesEventUpdateSort fromJson(String json) {
    return ensureInitialized().decodeJson<RecipesEventUpdateSort>(json);
  }
}

mixin RecipesEventUpdateSortMappable {
  String toJson() {
    return RecipesEventUpdateSortMapper.ensureInitialized().encodeJson<RecipesEventUpdateSort>(
      this as RecipesEventUpdateSort,
    );
  }

  Map<String, dynamic> toMap() {
    return RecipesEventUpdateSortMapper.ensureInitialized().encodeMap<RecipesEventUpdateSort>(
      this as RecipesEventUpdateSort,
    );
  }

  RecipesEventUpdateSortCopyWith<RecipesEventUpdateSort, RecipesEventUpdateSort, RecipesEventUpdateSort> get copyWith =>
      _RecipesEventUpdateSortCopyWithImpl<RecipesEventUpdateSort, RecipesEventUpdateSort>(
        this as RecipesEventUpdateSort,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RecipesEventUpdateSortMapper.ensureInitialized().stringifyValue(this as RecipesEventUpdateSort);
  }

  @override
  bool operator ==(Object other) {
    return RecipesEventUpdateSortMapper.ensureInitialized().equalsValue(this as RecipesEventUpdateSort, other);
  }

  @override
  int get hashCode {
    return RecipesEventUpdateSortMapper.ensureInitialized().hashValue(this as RecipesEventUpdateSort);
  }
}

extension RecipesEventUpdateSortValueCopy<$R, $Out> on ObjectCopyWith<$R, RecipesEventUpdateSort, $Out> {
  RecipesEventUpdateSortCopyWith<$R, RecipesEventUpdateSort, $Out> get $asRecipesEventUpdateSort =>
      $base.as((v, t, t2) => _RecipesEventUpdateSortCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipesEventUpdateSortCopyWith<$R, $In extends RecipesEventUpdateSort, $Out>
    implements RecipesEventCopyWith<$R, $In, $Out> {
  @override
  $R call({SortEntity? sort});
  RecipesEventUpdateSortCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipesEventUpdateSortCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RecipesEventUpdateSort, $Out>
    implements RecipesEventUpdateSortCopyWith<$R, RecipesEventUpdateSort, $Out> {
  _RecipesEventUpdateSortCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipesEventUpdateSort> $mapper = RecipesEventUpdateSortMapper.ensureInitialized();
  @override
  $R call({SortEntity? sort}) => $apply(FieldCopyWithData({if (sort != null) #sort: sort}));
  @override
  RecipesEventUpdateSort $make(CopyWithData data) => RecipesEventUpdateSort(sort: data.get(#sort, or: $value.sort));

  @override
  RecipesEventUpdateSortCopyWith<$R2, RecipesEventUpdateSort, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipesEventUpdateSortCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RecipesEventUpdateRatingMinMapper extends SubClassMapperBase<RecipesEventUpdateRatingMin> {
  RecipesEventUpdateRatingMinMapper._();

  static RecipesEventUpdateRatingMinMapper? _instance;
  static RecipesEventUpdateRatingMinMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesEventUpdateRatingMinMapper._());
      RecipesEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'RecipesEventUpdateRatingMin';

  static int? _$ratingMin(RecipesEventUpdateRatingMin v) => v.ratingMin;
  static const Field<RecipesEventUpdateRatingMin, int> _f$ratingMin = Field('ratingMin', _$ratingMin);

  @override
  final MappableFields<RecipesEventUpdateRatingMin> fields = const {
    #ratingMin: _f$ratingMin,
  };

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "update_rating_min";
  @override
  late final ClassMapperBase superMapper = RecipesEventMapper.ensureInitialized();

  static RecipesEventUpdateRatingMin _instantiate(DecodingData data) {
    return RecipesEventUpdateRatingMin(ratingMin: data.dec(_f$ratingMin));
  }

  @override
  final Function instantiate = _instantiate;

  static RecipesEventUpdateRatingMin fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipesEventUpdateRatingMin>(map);
  }

  static RecipesEventUpdateRatingMin fromJson(String json) {
    return ensureInitialized().decodeJson<RecipesEventUpdateRatingMin>(json);
  }
}

mixin RecipesEventUpdateRatingMinMappable {
  String toJson() {
    return RecipesEventUpdateRatingMinMapper.ensureInitialized().encodeJson<RecipesEventUpdateRatingMin>(
      this as RecipesEventUpdateRatingMin,
    );
  }

  Map<String, dynamic> toMap() {
    return RecipesEventUpdateRatingMinMapper.ensureInitialized().encodeMap<RecipesEventUpdateRatingMin>(
      this as RecipesEventUpdateRatingMin,
    );
  }

  RecipesEventUpdateRatingMinCopyWith<
    RecipesEventUpdateRatingMin,
    RecipesEventUpdateRatingMin,
    RecipesEventUpdateRatingMin
  >
  get copyWith => _RecipesEventUpdateRatingMinCopyWithImpl<RecipesEventUpdateRatingMin, RecipesEventUpdateRatingMin>(
    this as RecipesEventUpdateRatingMin,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return RecipesEventUpdateRatingMinMapper.ensureInitialized().stringifyValue(this as RecipesEventUpdateRatingMin);
  }

  @override
  bool operator ==(Object other) {
    return RecipesEventUpdateRatingMinMapper.ensureInitialized().equalsValue(
      this as RecipesEventUpdateRatingMin,
      other,
    );
  }

  @override
  int get hashCode {
    return RecipesEventUpdateRatingMinMapper.ensureInitialized().hashValue(this as RecipesEventUpdateRatingMin);
  }
}

extension RecipesEventUpdateRatingMinValueCopy<$R, $Out> on ObjectCopyWith<$R, RecipesEventUpdateRatingMin, $Out> {
  RecipesEventUpdateRatingMinCopyWith<$R, RecipesEventUpdateRatingMin, $Out> get $asRecipesEventUpdateRatingMin =>
      $base.as((v, t, t2) => _RecipesEventUpdateRatingMinCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipesEventUpdateRatingMinCopyWith<$R, $In extends RecipesEventUpdateRatingMin, $Out>
    implements RecipesEventCopyWith<$R, $In, $Out> {
  @override
  $R call({int? ratingMin});
  RecipesEventUpdateRatingMinCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipesEventUpdateRatingMinCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RecipesEventUpdateRatingMin, $Out>
    implements RecipesEventUpdateRatingMinCopyWith<$R, RecipesEventUpdateRatingMin, $Out> {
  _RecipesEventUpdateRatingMinCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipesEventUpdateRatingMin> $mapper =
      RecipesEventUpdateRatingMinMapper.ensureInitialized();
  @override
  $R call({Object? ratingMin = $none}) => $apply(FieldCopyWithData({if (ratingMin != $none) #ratingMin: ratingMin}));
  @override
  RecipesEventUpdateRatingMin $make(CopyWithData data) =>
      RecipesEventUpdateRatingMin(ratingMin: data.get(#ratingMin, or: $value.ratingMin));

  @override
  RecipesEventUpdateRatingMinCopyWith<$R2, RecipesEventUpdateRatingMin, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipesEventUpdateRatingMinCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RecipesEventUpdateTimeMapper extends SubClassMapperBase<RecipesEventUpdateTime> {
  RecipesEventUpdateTimeMapper._();

  static RecipesEventUpdateTimeMapper? _instance;
  static RecipesEventUpdateTimeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesEventUpdateTimeMapper._());
      RecipesEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'RecipesEventUpdateTime';

  static int? _$timeMin(RecipesEventUpdateTime v) => v.timeMin;
  static const Field<RecipesEventUpdateTime, int> _f$timeMin = Field('timeMin', _$timeMin);
  static int? _$timeMax(RecipesEventUpdateTime v) => v.timeMax;
  static const Field<RecipesEventUpdateTime, int> _f$timeMax = Field('timeMax', _$timeMax);

  @override
  final MappableFields<RecipesEventUpdateTime> fields = const {
    #timeMin: _f$timeMin,
    #timeMax: _f$timeMax,
  };

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "update_time";
  @override
  late final ClassMapperBase superMapper = RecipesEventMapper.ensureInitialized();

  static RecipesEventUpdateTime _instantiate(DecodingData data) {
    return RecipesEventUpdateTime(timeMin: data.dec(_f$timeMin), timeMax: data.dec(_f$timeMax));
  }

  @override
  final Function instantiate = _instantiate;

  static RecipesEventUpdateTime fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipesEventUpdateTime>(map);
  }

  static RecipesEventUpdateTime fromJson(String json) {
    return ensureInitialized().decodeJson<RecipesEventUpdateTime>(json);
  }
}

mixin RecipesEventUpdateTimeMappable {
  String toJson() {
    return RecipesEventUpdateTimeMapper.ensureInitialized().encodeJson<RecipesEventUpdateTime>(
      this as RecipesEventUpdateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return RecipesEventUpdateTimeMapper.ensureInitialized().encodeMap<RecipesEventUpdateTime>(
      this as RecipesEventUpdateTime,
    );
  }

  RecipesEventUpdateTimeCopyWith<RecipesEventUpdateTime, RecipesEventUpdateTime, RecipesEventUpdateTime> get copyWith =>
      _RecipesEventUpdateTimeCopyWithImpl<RecipesEventUpdateTime, RecipesEventUpdateTime>(
        this as RecipesEventUpdateTime,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RecipesEventUpdateTimeMapper.ensureInitialized().stringifyValue(this as RecipesEventUpdateTime);
  }

  @override
  bool operator ==(Object other) {
    return RecipesEventUpdateTimeMapper.ensureInitialized().equalsValue(this as RecipesEventUpdateTime, other);
  }

  @override
  int get hashCode {
    return RecipesEventUpdateTimeMapper.ensureInitialized().hashValue(this as RecipesEventUpdateTime);
  }
}

extension RecipesEventUpdateTimeValueCopy<$R, $Out> on ObjectCopyWith<$R, RecipesEventUpdateTime, $Out> {
  RecipesEventUpdateTimeCopyWith<$R, RecipesEventUpdateTime, $Out> get $asRecipesEventUpdateTime =>
      $base.as((v, t, t2) => _RecipesEventUpdateTimeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipesEventUpdateTimeCopyWith<$R, $In extends RecipesEventUpdateTime, $Out>
    implements RecipesEventCopyWith<$R, $In, $Out> {
  @override
  $R call({int? timeMin, int? timeMax});
  RecipesEventUpdateTimeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipesEventUpdateTimeCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RecipesEventUpdateTime, $Out>
    implements RecipesEventUpdateTimeCopyWith<$R, RecipesEventUpdateTime, $Out> {
  _RecipesEventUpdateTimeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipesEventUpdateTime> $mapper = RecipesEventUpdateTimeMapper.ensureInitialized();
  @override
  $R call({Object? timeMin = $none, Object? timeMax = $none}) =>
      $apply(FieldCopyWithData({if (timeMin != $none) #timeMin: timeMin, if (timeMax != $none) #timeMax: timeMax}));
  @override
  RecipesEventUpdateTime $make(CopyWithData data) => RecipesEventUpdateTime(
    timeMin: data.get(#timeMin, or: $value.timeMin),
    timeMax: data.get(#timeMax, or: $value.timeMax),
  );

  @override
  RecipesEventUpdateTimeCopyWith<$R2, RecipesEventUpdateTime, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipesEventUpdateTimeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RecipesEventUpdateServingsMapper extends SubClassMapperBase<RecipesEventUpdateServings> {
  RecipesEventUpdateServingsMapper._();

  static RecipesEventUpdateServingsMapper? _instance;
  static RecipesEventUpdateServingsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesEventUpdateServingsMapper._());
      RecipesEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'RecipesEventUpdateServings';

  static int? _$servingsMin(RecipesEventUpdateServings v) => v.servingsMin;
  static const Field<RecipesEventUpdateServings, int> _f$servingsMin = Field('servingsMin', _$servingsMin);
  static int? _$servingsMax(RecipesEventUpdateServings v) => v.servingsMax;
  static const Field<RecipesEventUpdateServings, int> _f$servingsMax = Field('servingsMax', _$servingsMax);

  @override
  final MappableFields<RecipesEventUpdateServings> fields = const {
    #servingsMin: _f$servingsMin,
    #servingsMax: _f$servingsMax,
  };

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "update_servings";
  @override
  late final ClassMapperBase superMapper = RecipesEventMapper.ensureInitialized();

  static RecipesEventUpdateServings _instantiate(DecodingData data) {
    return RecipesEventUpdateServings(servingsMin: data.dec(_f$servingsMin), servingsMax: data.dec(_f$servingsMax));
  }

  @override
  final Function instantiate = _instantiate;

  static RecipesEventUpdateServings fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipesEventUpdateServings>(map);
  }

  static RecipesEventUpdateServings fromJson(String json) {
    return ensureInitialized().decodeJson<RecipesEventUpdateServings>(json);
  }
}

mixin RecipesEventUpdateServingsMappable {
  String toJson() {
    return RecipesEventUpdateServingsMapper.ensureInitialized().encodeJson<RecipesEventUpdateServings>(
      this as RecipesEventUpdateServings,
    );
  }

  Map<String, dynamic> toMap() {
    return RecipesEventUpdateServingsMapper.ensureInitialized().encodeMap<RecipesEventUpdateServings>(
      this as RecipesEventUpdateServings,
    );
  }

  RecipesEventUpdateServingsCopyWith<RecipesEventUpdateServings, RecipesEventUpdateServings, RecipesEventUpdateServings>
  get copyWith => _RecipesEventUpdateServingsCopyWithImpl<RecipesEventUpdateServings, RecipesEventUpdateServings>(
    this as RecipesEventUpdateServings,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return RecipesEventUpdateServingsMapper.ensureInitialized().stringifyValue(this as RecipesEventUpdateServings);
  }

  @override
  bool operator ==(Object other) {
    return RecipesEventUpdateServingsMapper.ensureInitialized().equalsValue(this as RecipesEventUpdateServings, other);
  }

  @override
  int get hashCode {
    return RecipesEventUpdateServingsMapper.ensureInitialized().hashValue(this as RecipesEventUpdateServings);
  }
}

extension RecipesEventUpdateServingsValueCopy<$R, $Out> on ObjectCopyWith<$R, RecipesEventUpdateServings, $Out> {
  RecipesEventUpdateServingsCopyWith<$R, RecipesEventUpdateServings, $Out> get $asRecipesEventUpdateServings =>
      $base.as((v, t, t2) => _RecipesEventUpdateServingsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipesEventUpdateServingsCopyWith<$R, $In extends RecipesEventUpdateServings, $Out>
    implements RecipesEventCopyWith<$R, $In, $Out> {
  @override
  $R call({int? servingsMin, int? servingsMax});
  RecipesEventUpdateServingsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipesEventUpdateServingsCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RecipesEventUpdateServings, $Out>
    implements RecipesEventUpdateServingsCopyWith<$R, RecipesEventUpdateServings, $Out> {
  _RecipesEventUpdateServingsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipesEventUpdateServings> $mapper = RecipesEventUpdateServingsMapper.ensureInitialized();
  @override
  $R call({Object? servingsMin = $none, Object? servingsMax = $none}) => $apply(
    FieldCopyWithData({
      if (servingsMin != $none) #servingsMin: servingsMin,
      if (servingsMax != $none) #servingsMax: servingsMax,
    }),
  );
  @override
  RecipesEventUpdateServings $make(CopyWithData data) => RecipesEventUpdateServings(
    servingsMin: data.get(#servingsMin, or: $value.servingsMin),
    servingsMax: data.get(#servingsMax, or: $value.servingsMax),
  );

  @override
  RecipesEventUpdateServingsCopyWith<$R2, RecipesEventUpdateServings, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipesEventUpdateServingsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RecipesEventUpdateDifficultyMapper extends SubClassMapperBase<RecipesEventUpdateDifficulty> {
  RecipesEventUpdateDifficultyMapper._();

  static RecipesEventUpdateDifficultyMapper? _instance;
  static RecipesEventUpdateDifficultyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesEventUpdateDifficultyMapper._());
      RecipesEventMapper.ensureInitialized().addSubMapper(_instance!);
      DifficultyEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RecipesEventUpdateDifficulty';

  static Set<DifficultyEntity> _$difficulties(RecipesEventUpdateDifficulty v) => v.difficulties;
  static const Field<RecipesEventUpdateDifficulty, Set<DifficultyEntity>> _f$difficulties = Field(
    'difficulties',
    _$difficulties,
  );

  @override
  final MappableFields<RecipesEventUpdateDifficulty> fields = const {
    #difficulties: _f$difficulties,
  };

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "update_difficulty";
  @override
  late final ClassMapperBase superMapper = RecipesEventMapper.ensureInitialized();

  static RecipesEventUpdateDifficulty _instantiate(DecodingData data) {
    return RecipesEventUpdateDifficulty(difficulties: data.dec(_f$difficulties));
  }

  @override
  final Function instantiate = _instantiate;

  static RecipesEventUpdateDifficulty fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipesEventUpdateDifficulty>(map);
  }

  static RecipesEventUpdateDifficulty fromJson(String json) {
    return ensureInitialized().decodeJson<RecipesEventUpdateDifficulty>(json);
  }
}

mixin RecipesEventUpdateDifficultyMappable {
  String toJson() {
    return RecipesEventUpdateDifficultyMapper.ensureInitialized().encodeJson<RecipesEventUpdateDifficulty>(
      this as RecipesEventUpdateDifficulty,
    );
  }

  Map<String, dynamic> toMap() {
    return RecipesEventUpdateDifficultyMapper.ensureInitialized().encodeMap<RecipesEventUpdateDifficulty>(
      this as RecipesEventUpdateDifficulty,
    );
  }

  RecipesEventUpdateDifficultyCopyWith<
    RecipesEventUpdateDifficulty,
    RecipesEventUpdateDifficulty,
    RecipesEventUpdateDifficulty
  >
  get copyWith => _RecipesEventUpdateDifficultyCopyWithImpl<RecipesEventUpdateDifficulty, RecipesEventUpdateDifficulty>(
    this as RecipesEventUpdateDifficulty,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return RecipesEventUpdateDifficultyMapper.ensureInitialized().stringifyValue(this as RecipesEventUpdateDifficulty);
  }

  @override
  bool operator ==(Object other) {
    return RecipesEventUpdateDifficultyMapper.ensureInitialized().equalsValue(
      this as RecipesEventUpdateDifficulty,
      other,
    );
  }

  @override
  int get hashCode {
    return RecipesEventUpdateDifficultyMapper.ensureInitialized().hashValue(this as RecipesEventUpdateDifficulty);
  }
}

extension RecipesEventUpdateDifficultyValueCopy<$R, $Out> on ObjectCopyWith<$R, RecipesEventUpdateDifficulty, $Out> {
  RecipesEventUpdateDifficultyCopyWith<$R, RecipesEventUpdateDifficulty, $Out> get $asRecipesEventUpdateDifficulty =>
      $base.as((v, t, t2) => _RecipesEventUpdateDifficultyCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipesEventUpdateDifficultyCopyWith<$R, $In extends RecipesEventUpdateDifficulty, $Out>
    implements RecipesEventCopyWith<$R, $In, $Out> {
  @override
  $R call({Set<DifficultyEntity>? difficulties});
  RecipesEventUpdateDifficultyCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipesEventUpdateDifficultyCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RecipesEventUpdateDifficulty, $Out>
    implements RecipesEventUpdateDifficultyCopyWith<$R, RecipesEventUpdateDifficulty, $Out> {
  _RecipesEventUpdateDifficultyCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipesEventUpdateDifficulty> $mapper =
      RecipesEventUpdateDifficultyMapper.ensureInitialized();
  @override
  $R call({Set<DifficultyEntity>? difficulties}) =>
      $apply(FieldCopyWithData({if (difficulties != null) #difficulties: difficulties}));
  @override
  RecipesEventUpdateDifficulty $make(CopyWithData data) =>
      RecipesEventUpdateDifficulty(difficulties: data.get(#difficulties, or: $value.difficulties));

  @override
  RecipesEventUpdateDifficultyCopyWith<$R2, RecipesEventUpdateDifficulty, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RecipesEventUpdateDifficultyCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RecipesEventUpdateTagsMapper extends SubClassMapperBase<RecipesEventUpdateTags> {
  RecipesEventUpdateTagsMapper._();

  static RecipesEventUpdateTagsMapper? _instance;
  static RecipesEventUpdateTagsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesEventUpdateTagsMapper._());
      RecipesEventMapper.ensureInitialized().addSubMapper(_instance!);
      TagEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RecipesEventUpdateTags';

  static Set<TagEntity> _$tags(RecipesEventUpdateTags v) => v.tags;
  static const Field<RecipesEventUpdateTags, Set<TagEntity>> _f$tags = Field('tags', _$tags);

  @override
  final MappableFields<RecipesEventUpdateTags> fields = const {
    #tags: _f$tags,
  };

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "update_tags";
  @override
  late final ClassMapperBase superMapper = RecipesEventMapper.ensureInitialized();

  static RecipesEventUpdateTags _instantiate(DecodingData data) {
    return RecipesEventUpdateTags(tags: data.dec(_f$tags));
  }

  @override
  final Function instantiate = _instantiate;

  static RecipesEventUpdateTags fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipesEventUpdateTags>(map);
  }

  static RecipesEventUpdateTags fromJson(String json) {
    return ensureInitialized().decodeJson<RecipesEventUpdateTags>(json);
  }
}

mixin RecipesEventUpdateTagsMappable {
  String toJson() {
    return RecipesEventUpdateTagsMapper.ensureInitialized().encodeJson<RecipesEventUpdateTags>(
      this as RecipesEventUpdateTags,
    );
  }

  Map<String, dynamic> toMap() {
    return RecipesEventUpdateTagsMapper.ensureInitialized().encodeMap<RecipesEventUpdateTags>(
      this as RecipesEventUpdateTags,
    );
  }

  RecipesEventUpdateTagsCopyWith<RecipesEventUpdateTags, RecipesEventUpdateTags, RecipesEventUpdateTags> get copyWith =>
      _RecipesEventUpdateTagsCopyWithImpl<RecipesEventUpdateTags, RecipesEventUpdateTags>(
        this as RecipesEventUpdateTags,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RecipesEventUpdateTagsMapper.ensureInitialized().stringifyValue(this as RecipesEventUpdateTags);
  }

  @override
  bool operator ==(Object other) {
    return RecipesEventUpdateTagsMapper.ensureInitialized().equalsValue(this as RecipesEventUpdateTags, other);
  }

  @override
  int get hashCode {
    return RecipesEventUpdateTagsMapper.ensureInitialized().hashValue(this as RecipesEventUpdateTags);
  }
}

extension RecipesEventUpdateTagsValueCopy<$R, $Out> on ObjectCopyWith<$R, RecipesEventUpdateTags, $Out> {
  RecipesEventUpdateTagsCopyWith<$R, RecipesEventUpdateTags, $Out> get $asRecipesEventUpdateTags =>
      $base.as((v, t, t2) => _RecipesEventUpdateTagsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipesEventUpdateTagsCopyWith<$R, $In extends RecipesEventUpdateTags, $Out>
    implements RecipesEventCopyWith<$R, $In, $Out> {
  @override
  $R call({Set<TagEntity>? tags});
  RecipesEventUpdateTagsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipesEventUpdateTagsCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RecipesEventUpdateTags, $Out>
    implements RecipesEventUpdateTagsCopyWith<$R, RecipesEventUpdateTags, $Out> {
  _RecipesEventUpdateTagsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipesEventUpdateTags> $mapper = RecipesEventUpdateTagsMapper.ensureInitialized();
  @override
  $R call({Set<TagEntity>? tags}) => $apply(FieldCopyWithData({if (tags != null) #tags: tags}));
  @override
  RecipesEventUpdateTags $make(CopyWithData data) => RecipesEventUpdateTags(tags: data.get(#tags, or: $value.tags));

  @override
  RecipesEventUpdateTagsCopyWith<$R2, RecipesEventUpdateTags, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipesEventUpdateTagsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RecipesEventToggleSelectedMapper extends SubClassMapperBase<RecipesEventToggleSelected> {
  RecipesEventToggleSelectedMapper._();

  static RecipesEventToggleSelectedMapper? _instance;
  static RecipesEventToggleSelectedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesEventToggleSelectedMapper._());
      RecipesEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'RecipesEventToggleSelected';

  static String _$recipeId(RecipesEventToggleSelected v) => v.recipeId;
  static const Field<RecipesEventToggleSelected, String> _f$recipeId = Field('recipeId', _$recipeId);

  @override
  final MappableFields<RecipesEventToggleSelected> fields = const {
    #recipeId: _f$recipeId,
  };

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "toggle_selected";
  @override
  late final ClassMapperBase superMapper = RecipesEventMapper.ensureInitialized();

  static RecipesEventToggleSelected _instantiate(DecodingData data) {
    return RecipesEventToggleSelected(recipeId: data.dec(_f$recipeId));
  }

  @override
  final Function instantiate = _instantiate;

  static RecipesEventToggleSelected fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipesEventToggleSelected>(map);
  }

  static RecipesEventToggleSelected fromJson(String json) {
    return ensureInitialized().decodeJson<RecipesEventToggleSelected>(json);
  }
}

mixin RecipesEventToggleSelectedMappable {
  String toJson() {
    return RecipesEventToggleSelectedMapper.ensureInitialized().encodeJson<RecipesEventToggleSelected>(
      this as RecipesEventToggleSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return RecipesEventToggleSelectedMapper.ensureInitialized().encodeMap<RecipesEventToggleSelected>(
      this as RecipesEventToggleSelected,
    );
  }

  RecipesEventToggleSelectedCopyWith<RecipesEventToggleSelected, RecipesEventToggleSelected, RecipesEventToggleSelected>
  get copyWith => _RecipesEventToggleSelectedCopyWithImpl<RecipesEventToggleSelected, RecipesEventToggleSelected>(
    this as RecipesEventToggleSelected,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return RecipesEventToggleSelectedMapper.ensureInitialized().stringifyValue(this as RecipesEventToggleSelected);
  }

  @override
  bool operator ==(Object other) {
    return RecipesEventToggleSelectedMapper.ensureInitialized().equalsValue(this as RecipesEventToggleSelected, other);
  }

  @override
  int get hashCode {
    return RecipesEventToggleSelectedMapper.ensureInitialized().hashValue(this as RecipesEventToggleSelected);
  }
}

extension RecipesEventToggleSelectedValueCopy<$R, $Out> on ObjectCopyWith<$R, RecipesEventToggleSelected, $Out> {
  RecipesEventToggleSelectedCopyWith<$R, RecipesEventToggleSelected, $Out> get $asRecipesEventToggleSelected =>
      $base.as((v, t, t2) => _RecipesEventToggleSelectedCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipesEventToggleSelectedCopyWith<$R, $In extends RecipesEventToggleSelected, $Out>
    implements RecipesEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? recipeId});
  RecipesEventToggleSelectedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipesEventToggleSelectedCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RecipesEventToggleSelected, $Out>
    implements RecipesEventToggleSelectedCopyWith<$R, RecipesEventToggleSelected, $Out> {
  _RecipesEventToggleSelectedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipesEventToggleSelected> $mapper = RecipesEventToggleSelectedMapper.ensureInitialized();
  @override
  $R call({String? recipeId}) => $apply(FieldCopyWithData({if (recipeId != null) #recipeId: recipeId}));
  @override
  RecipesEventToggleSelected $make(CopyWithData data) =>
      RecipesEventToggleSelected(recipeId: data.get(#recipeId, or: $value.recipeId));

  @override
  RecipesEventToggleSelectedCopyWith<$R2, RecipesEventToggleSelected, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipesEventToggleSelectedCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RecipesEventDeleteSelectedMapper extends SubClassMapperBase<RecipesEventDeleteSelected> {
  RecipesEventDeleteSelectedMapper._();

  static RecipesEventDeleteSelectedMapper? _instance;
  static RecipesEventDeleteSelectedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesEventDeleteSelectedMapper._());
      RecipesEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'RecipesEventDeleteSelected';

  @override
  final MappableFields<RecipesEventDeleteSelected> fields = const {};

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "delete_selected";
  @override
  late final ClassMapperBase superMapper = RecipesEventMapper.ensureInitialized();

  static RecipesEventDeleteSelected _instantiate(DecodingData data) {
    return RecipesEventDeleteSelected();
  }

  @override
  final Function instantiate = _instantiate;

  static RecipesEventDeleteSelected fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipesEventDeleteSelected>(map);
  }

  static RecipesEventDeleteSelected fromJson(String json) {
    return ensureInitialized().decodeJson<RecipesEventDeleteSelected>(json);
  }
}

mixin RecipesEventDeleteSelectedMappable {
  String toJson() {
    return RecipesEventDeleteSelectedMapper.ensureInitialized().encodeJson<RecipesEventDeleteSelected>(
      this as RecipesEventDeleteSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return RecipesEventDeleteSelectedMapper.ensureInitialized().encodeMap<RecipesEventDeleteSelected>(
      this as RecipesEventDeleteSelected,
    );
  }

  RecipesEventDeleteSelectedCopyWith<RecipesEventDeleteSelected, RecipesEventDeleteSelected, RecipesEventDeleteSelected>
  get copyWith => _RecipesEventDeleteSelectedCopyWithImpl<RecipesEventDeleteSelected, RecipesEventDeleteSelected>(
    this as RecipesEventDeleteSelected,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return RecipesEventDeleteSelectedMapper.ensureInitialized().stringifyValue(this as RecipesEventDeleteSelected);
  }

  @override
  bool operator ==(Object other) {
    return RecipesEventDeleteSelectedMapper.ensureInitialized().equalsValue(this as RecipesEventDeleteSelected, other);
  }

  @override
  int get hashCode {
    return RecipesEventDeleteSelectedMapper.ensureInitialized().hashValue(this as RecipesEventDeleteSelected);
  }
}

extension RecipesEventDeleteSelectedValueCopy<$R, $Out> on ObjectCopyWith<$R, RecipesEventDeleteSelected, $Out> {
  RecipesEventDeleteSelectedCopyWith<$R, RecipesEventDeleteSelected, $Out> get $asRecipesEventDeleteSelected =>
      $base.as((v, t, t2) => _RecipesEventDeleteSelectedCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipesEventDeleteSelectedCopyWith<$R, $In extends RecipesEventDeleteSelected, $Out>
    implements RecipesEventCopyWith<$R, $In, $Out> {
  @override
  $R call();
  RecipesEventDeleteSelectedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipesEventDeleteSelectedCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RecipesEventDeleteSelected, $Out>
    implements RecipesEventDeleteSelectedCopyWith<$R, RecipesEventDeleteSelected, $Out> {
  _RecipesEventDeleteSelectedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipesEventDeleteSelected> $mapper = RecipesEventDeleteSelectedMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  RecipesEventDeleteSelected $make(CopyWithData data) => RecipesEventDeleteSelected();

  @override
  RecipesEventDeleteSelectedCopyWith<$R2, RecipesEventDeleteSelected, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipesEventDeleteSelectedCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RecipesEventResetSelectedMapper extends SubClassMapperBase<RecipesEventResetSelected> {
  RecipesEventResetSelectedMapper._();

  static RecipesEventResetSelectedMapper? _instance;
  static RecipesEventResetSelectedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesEventResetSelectedMapper._());
      RecipesEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'RecipesEventResetSelected';

  @override
  final MappableFields<RecipesEventResetSelected> fields = const {};

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "reset_selected";
  @override
  late final ClassMapperBase superMapper = RecipesEventMapper.ensureInitialized();

  static RecipesEventResetSelected _instantiate(DecodingData data) {
    return RecipesEventResetSelected();
  }

  @override
  final Function instantiate = _instantiate;

  static RecipesEventResetSelected fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipesEventResetSelected>(map);
  }

  static RecipesEventResetSelected fromJson(String json) {
    return ensureInitialized().decodeJson<RecipesEventResetSelected>(json);
  }
}

mixin RecipesEventResetSelectedMappable {
  String toJson() {
    return RecipesEventResetSelectedMapper.ensureInitialized().encodeJson<RecipesEventResetSelected>(
      this as RecipesEventResetSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return RecipesEventResetSelectedMapper.ensureInitialized().encodeMap<RecipesEventResetSelected>(
      this as RecipesEventResetSelected,
    );
  }

  RecipesEventResetSelectedCopyWith<RecipesEventResetSelected, RecipesEventResetSelected, RecipesEventResetSelected>
  get copyWith => _RecipesEventResetSelectedCopyWithImpl<RecipesEventResetSelected, RecipesEventResetSelected>(
    this as RecipesEventResetSelected,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return RecipesEventResetSelectedMapper.ensureInitialized().stringifyValue(this as RecipesEventResetSelected);
  }

  @override
  bool operator ==(Object other) {
    return RecipesEventResetSelectedMapper.ensureInitialized().equalsValue(this as RecipesEventResetSelected, other);
  }

  @override
  int get hashCode {
    return RecipesEventResetSelectedMapper.ensureInitialized().hashValue(this as RecipesEventResetSelected);
  }
}

extension RecipesEventResetSelectedValueCopy<$R, $Out> on ObjectCopyWith<$R, RecipesEventResetSelected, $Out> {
  RecipesEventResetSelectedCopyWith<$R, RecipesEventResetSelected, $Out> get $asRecipesEventResetSelected =>
      $base.as((v, t, t2) => _RecipesEventResetSelectedCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipesEventResetSelectedCopyWith<$R, $In extends RecipesEventResetSelected, $Out>
    implements RecipesEventCopyWith<$R, $In, $Out> {
  @override
  $R call();
  RecipesEventResetSelectedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipesEventResetSelectedCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RecipesEventResetSelected, $Out>
    implements RecipesEventResetSelectedCopyWith<$R, RecipesEventResetSelected, $Out> {
  _RecipesEventResetSelectedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipesEventResetSelected> $mapper = RecipesEventResetSelectedMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  RecipesEventResetSelected $make(CopyWithData data) => RecipesEventResetSelected();

  @override
  RecipesEventResetSelectedCopyWith<$R2, RecipesEventResetSelected, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipesEventResetSelectedCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
