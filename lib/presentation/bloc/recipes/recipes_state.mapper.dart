// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'recipes_state.dart';

class RecipesStatusMapper extends EnumMapper<RecipesStatus> {
  RecipesStatusMapper._();

  static RecipesStatusMapper? _instance;
  static RecipesStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesStatusMapper._());
    }
    return _instance!;
  }

  static RecipesStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  RecipesStatus decode(dynamic value) {
    switch (value) {
      case r'loading':
        return RecipesStatus.loading;
      case r'error':
        return RecipesStatus.error;
      case r'empty':
        return RecipesStatus.empty;
      case r'success':
        return RecipesStatus.success;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(RecipesStatus self) {
    switch (self) {
      case RecipesStatus.loading:
        return r'loading';
      case RecipesStatus.error:
        return r'error';
      case RecipesStatus.empty:
        return r'empty';
      case RecipesStatus.success:
        return r'success';
    }
  }
}

extension RecipesStatusMapperExtension on RecipesStatus {
  String toValue() {
    RecipesStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<RecipesStatus>(this) as String;
  }
}

class RecipesStateMapper extends ClassMapperBase<RecipesState> {
  RecipesStateMapper._();

  static RecipesStateMapper? _instance;
  static RecipesStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesStateMapper._());
      RecipesStatusMapper.ensureInitialized();
      SortEntityMapper.ensureInitialized();
      FilterEntityMapper.ensureInitialized();
      RecipeCardDetailsMapper.ensureInitialized();
      ErrorCodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RecipesState';

  static RecipesStatus _$status(RecipesState v) => v.status;
  static const Field<RecipesState, RecipesStatus> _f$status = Field('status', _$status);
  static String _$searchQuery(RecipesState v) => v.searchQuery;
  static const Field<RecipesState, String> _f$searchQuery = Field('searchQuery', _$searchQuery);
  static SortEntity _$sort(RecipesState v) => v.sort;
  static const Field<RecipesState, SortEntity> _f$sort = Field('sort', _$sort);
  static FilterEntity _$filter(RecipesState v) => v.filter;
  static const Field<RecipesState, FilterEntity> _f$filter = Field('filter', _$filter);
  static List<RecipeCardDetails> _$recipes(RecipesState v) => v.recipes;
  static const Field<RecipesState, List<RecipeCardDetails>> _f$recipes = Field('recipes', _$recipes);
  static Set<String> _$selectedIds(RecipesState v) => v.selectedIds;
  static const Field<RecipesState, Set<String>> _f$selectedIds = Field('selectedIds', _$selectedIds);
  static bool _$isDeleting(RecipesState v) => v.isDeleting;
  static const Field<RecipesState, bool> _f$isDeleting = Field('isDeleting', _$isDeleting);
  static ErrorCode? _$error(RecipesState v) => v.error;
  static const Field<RecipesState, ErrorCode> _f$error = Field('error', _$error);

  @override
  final MappableFields<RecipesState> fields = const {
    #status: _f$status,
    #searchQuery: _f$searchQuery,
    #sort: _f$sort,
    #filter: _f$filter,
    #recipes: _f$recipes,
    #selectedIds: _f$selectedIds,
    #isDeleting: _f$isDeleting,
    #error: _f$error,
  };

  static RecipesState _instantiate(DecodingData data) {
    return RecipesState(
      status: data.dec(_f$status),
      searchQuery: data.dec(_f$searchQuery),
      sort: data.dec(_f$sort),
      filter: data.dec(_f$filter),
      recipes: data.dec(_f$recipes),
      selectedIds: data.dec(_f$selectedIds),
      isDeleting: data.dec(_f$isDeleting),
      error: data.dec(_f$error),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RecipesState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipesState>(map);
  }

  static RecipesState fromJson(String json) {
    return ensureInitialized().decodeJson<RecipesState>(json);
  }
}

mixin RecipesStateMappable {
  String toJson() {
    return RecipesStateMapper.ensureInitialized().encodeJson<RecipesState>(this as RecipesState);
  }

  Map<String, dynamic> toMap() {
    return RecipesStateMapper.ensureInitialized().encodeMap<RecipesState>(this as RecipesState);
  }

  RecipesStateCopyWith<RecipesState, RecipesState, RecipesState> get copyWith =>
      _RecipesStateCopyWithImpl<RecipesState, RecipesState>(this as RecipesState, $identity, $identity);
  @override
  String toString() {
    return RecipesStateMapper.ensureInitialized().stringifyValue(this as RecipesState);
  }

  @override
  bool operator ==(Object other) {
    return RecipesStateMapper.ensureInitialized().equalsValue(this as RecipesState, other);
  }

  @override
  int get hashCode {
    return RecipesStateMapper.ensureInitialized().hashValue(this as RecipesState);
  }
}

extension RecipesStateValueCopy<$R, $Out> on ObjectCopyWith<$R, RecipesState, $Out> {
  RecipesStateCopyWith<$R, RecipesState, $Out> get $asRecipesState =>
      $base.as((v, t, t2) => _RecipesStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipesStateCopyWith<$R, $In extends RecipesState, $Out> implements ClassCopyWith<$R, $In, $Out> {
  FilterEntityCopyWith<$R, FilterEntity, FilterEntity> get filter;
  ListCopyWith<$R, RecipeCardDetails, RecipeCardDetailsCopyWith<$R, RecipeCardDetails, RecipeCardDetails>> get recipes;
  $R call({
    RecipesStatus? status,
    String? searchQuery,
    SortEntity? sort,
    FilterEntity? filter,
    List<RecipeCardDetails>? recipes,
    Set<String>? selectedIds,
    bool? isDeleting,
    ErrorCode? error,
  });
  RecipesStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipesStateCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RecipesState, $Out>
    implements RecipesStateCopyWith<$R, RecipesState, $Out> {
  _RecipesStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipesState> $mapper = RecipesStateMapper.ensureInitialized();
  @override
  FilterEntityCopyWith<$R, FilterEntity, FilterEntity> get filter =>
      $value.filter.copyWith.$chain((v) => call(filter: v));
  @override
  ListCopyWith<$R, RecipeCardDetails, RecipeCardDetailsCopyWith<$R, RecipeCardDetails, RecipeCardDetails>>
  get recipes => ListCopyWith($value.recipes, (v, t) => v.copyWith.$chain(t), (v) => call(recipes: v));
  @override
  $R call({
    RecipesStatus? status,
    String? searchQuery,
    SortEntity? sort,
    FilterEntity? filter,
    List<RecipeCardDetails>? recipes,
    Set<String>? selectedIds,
    bool? isDeleting,
    Object? error = $none,
  }) => $apply(
    FieldCopyWithData({
      if (status != null) #status: status,
      if (searchQuery != null) #searchQuery: searchQuery,
      if (sort != null) #sort: sort,
      if (filter != null) #filter: filter,
      if (recipes != null) #recipes: recipes,
      if (selectedIds != null) #selectedIds: selectedIds,
      if (isDeleting != null) #isDeleting: isDeleting,
      if (error != $none) #error: error,
    }),
  );
  @override
  RecipesState $make(CopyWithData data) => RecipesState(
    status: data.get(#status, or: $value.status),
    searchQuery: data.get(#searchQuery, or: $value.searchQuery),
    sort: data.get(#sort, or: $value.sort),
    filter: data.get(#filter, or: $value.filter),
    recipes: data.get(#recipes, or: $value.recipes),
    selectedIds: data.get(#selectedIds, or: $value.selectedIds),
    isDeleting: data.get(#isDeleting, or: $value.isDeleting),
    error: data.get(#error, or: $value.error),
  );

  @override
  RecipesStateCopyWith<$R2, RecipesState, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipesStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
