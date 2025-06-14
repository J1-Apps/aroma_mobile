// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'recipes_state.dart';

class RecipesStateMapper extends ClassMapperBase<RecipesState> {
  RecipesStateMapper._();

  static RecipesStateMapper? _instance;
  static RecipesStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesStateMapper._());
      RecipesStateLoadingMapper.ensureInitialized();
      RecipesStateErrorMapper.ensureInitialized();
      RecipesStateSuccessMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RecipesState';

  @override
  final MappableFields<RecipesState> fields = const {};

  static RecipesState _instantiate(DecodingData data) {
    throw MapperException.missingSubclass('RecipesState', 'status', '${data.value['status']}');
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
  String toJson();
  Map<String, dynamic> toMap();
  RecipesStateCopyWith<RecipesState, RecipesState, RecipesState> get copyWith;
}

abstract class RecipesStateCopyWith<$R, $In extends RecipesState, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  RecipesStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class RecipesStateLoadingMapper extends SubClassMapperBase<RecipesStateLoading> {
  RecipesStateLoadingMapper._();

  static RecipesStateLoadingMapper? _instance;
  static RecipesStateLoadingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesStateLoadingMapper._());
      RecipesStateMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'RecipesStateLoading';

  @override
  final MappableFields<RecipesStateLoading> fields = const {};

  @override
  final String discriminatorKey = 'status';
  @override
  final dynamic discriminatorValue = "loading";
  @override
  late final ClassMapperBase superMapper = RecipesStateMapper.ensureInitialized();

  static RecipesStateLoading _instantiate(DecodingData data) {
    return RecipesStateLoading();
  }

  @override
  final Function instantiate = _instantiate;

  static RecipesStateLoading fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipesStateLoading>(map);
  }

  static RecipesStateLoading fromJson(String json) {
    return ensureInitialized().decodeJson<RecipesStateLoading>(json);
  }
}

mixin RecipesStateLoadingMappable {
  String toJson() {
    return RecipesStateLoadingMapper.ensureInitialized().encodeJson<RecipesStateLoading>(this as RecipesStateLoading);
  }

  Map<String, dynamic> toMap() {
    return RecipesStateLoadingMapper.ensureInitialized().encodeMap<RecipesStateLoading>(this as RecipesStateLoading);
  }

  RecipesStateLoadingCopyWith<RecipesStateLoading, RecipesStateLoading, RecipesStateLoading> get copyWith =>
      _RecipesStateLoadingCopyWithImpl<RecipesStateLoading, RecipesStateLoading>(
        this as RecipesStateLoading,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RecipesStateLoadingMapper.ensureInitialized().stringifyValue(this as RecipesStateLoading);
  }

  @override
  bool operator ==(Object other) {
    return RecipesStateLoadingMapper.ensureInitialized().equalsValue(this as RecipesStateLoading, other);
  }

  @override
  int get hashCode {
    return RecipesStateLoadingMapper.ensureInitialized().hashValue(this as RecipesStateLoading);
  }
}

extension RecipesStateLoadingValueCopy<$R, $Out> on ObjectCopyWith<$R, RecipesStateLoading, $Out> {
  RecipesStateLoadingCopyWith<$R, RecipesStateLoading, $Out> get $asRecipesStateLoading =>
      $base.as((v, t, t2) => _RecipesStateLoadingCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipesStateLoadingCopyWith<$R, $In extends RecipesStateLoading, $Out>
    implements RecipesStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  RecipesStateLoadingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipesStateLoadingCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RecipesStateLoading, $Out>
    implements RecipesStateLoadingCopyWith<$R, RecipesStateLoading, $Out> {
  _RecipesStateLoadingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipesStateLoading> $mapper = RecipesStateLoadingMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  RecipesStateLoading $make(CopyWithData data) => RecipesStateLoading();

  @override
  RecipesStateLoadingCopyWith<$R2, RecipesStateLoading, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipesStateLoadingCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RecipesStateErrorMapper extends SubClassMapperBase<RecipesStateError> {
  RecipesStateErrorMapper._();

  static RecipesStateErrorMapper? _instance;
  static RecipesStateErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesStateErrorMapper._());
      RecipesStateMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'RecipesStateError';

  @override
  final MappableFields<RecipesStateError> fields = const {};

  @override
  final String discriminatorKey = 'status';
  @override
  final dynamic discriminatorValue = "error";
  @override
  late final ClassMapperBase superMapper = RecipesStateMapper.ensureInitialized();

  static RecipesStateError _instantiate(DecodingData data) {
    return RecipesStateError();
  }

  @override
  final Function instantiate = _instantiate;

  static RecipesStateError fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipesStateError>(map);
  }

  static RecipesStateError fromJson(String json) {
    return ensureInitialized().decodeJson<RecipesStateError>(json);
  }
}

mixin RecipesStateErrorMappable {
  String toJson() {
    return RecipesStateErrorMapper.ensureInitialized().encodeJson<RecipesStateError>(this as RecipesStateError);
  }

  Map<String, dynamic> toMap() {
    return RecipesStateErrorMapper.ensureInitialized().encodeMap<RecipesStateError>(this as RecipesStateError);
  }

  RecipesStateErrorCopyWith<RecipesStateError, RecipesStateError, RecipesStateError> get copyWith =>
      _RecipesStateErrorCopyWithImpl<RecipesStateError, RecipesStateError>(
        this as RecipesStateError,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RecipesStateErrorMapper.ensureInitialized().stringifyValue(this as RecipesStateError);
  }

  @override
  bool operator ==(Object other) {
    return RecipesStateErrorMapper.ensureInitialized().equalsValue(this as RecipesStateError, other);
  }

  @override
  int get hashCode {
    return RecipesStateErrorMapper.ensureInitialized().hashValue(this as RecipesStateError);
  }
}

extension RecipesStateErrorValueCopy<$R, $Out> on ObjectCopyWith<$R, RecipesStateError, $Out> {
  RecipesStateErrorCopyWith<$R, RecipesStateError, $Out> get $asRecipesStateError =>
      $base.as((v, t, t2) => _RecipesStateErrorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipesStateErrorCopyWith<$R, $In extends RecipesStateError, $Out>
    implements RecipesStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  RecipesStateErrorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipesStateErrorCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RecipesStateError, $Out>
    implements RecipesStateErrorCopyWith<$R, RecipesStateError, $Out> {
  _RecipesStateErrorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipesStateError> $mapper = RecipesStateErrorMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  RecipesStateError $make(CopyWithData data) => RecipesStateError();

  @override
  RecipesStateErrorCopyWith<$R2, RecipesStateError, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipesStateErrorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RecipesStateSuccessMapper extends SubClassMapperBase<RecipesStateSuccess> {
  RecipesStateSuccessMapper._();

  static RecipesStateSuccessMapper? _instance;
  static RecipesStateSuccessMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipesStateSuccessMapper._());
      RecipesStateMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'RecipesStateSuccess';

  @override
  final MappableFields<RecipesStateSuccess> fields = const {};

  @override
  final String discriminatorKey = 'status';
  @override
  final dynamic discriminatorValue = "success";
  @override
  late final ClassMapperBase superMapper = RecipesStateMapper.ensureInitialized();

  static RecipesStateSuccess _instantiate(DecodingData data) {
    return RecipesStateSuccess();
  }

  @override
  final Function instantiate = _instantiate;

  static RecipesStateSuccess fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipesStateSuccess>(map);
  }

  static RecipesStateSuccess fromJson(String json) {
    return ensureInitialized().decodeJson<RecipesStateSuccess>(json);
  }
}

mixin RecipesStateSuccessMappable {
  String toJson() {
    return RecipesStateSuccessMapper.ensureInitialized().encodeJson<RecipesStateSuccess>(this as RecipesStateSuccess);
  }

  Map<String, dynamic> toMap() {
    return RecipesStateSuccessMapper.ensureInitialized().encodeMap<RecipesStateSuccess>(this as RecipesStateSuccess);
  }

  RecipesStateSuccessCopyWith<RecipesStateSuccess, RecipesStateSuccess, RecipesStateSuccess> get copyWith =>
      _RecipesStateSuccessCopyWithImpl<RecipesStateSuccess, RecipesStateSuccess>(
        this as RecipesStateSuccess,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RecipesStateSuccessMapper.ensureInitialized().stringifyValue(this as RecipesStateSuccess);
  }

  @override
  bool operator ==(Object other) {
    return RecipesStateSuccessMapper.ensureInitialized().equalsValue(this as RecipesStateSuccess, other);
  }

  @override
  int get hashCode {
    return RecipesStateSuccessMapper.ensureInitialized().hashValue(this as RecipesStateSuccess);
  }
}

extension RecipesStateSuccessValueCopy<$R, $Out> on ObjectCopyWith<$R, RecipesStateSuccess, $Out> {
  RecipesStateSuccessCopyWith<$R, RecipesStateSuccess, $Out> get $asRecipesStateSuccess =>
      $base.as((v, t, t2) => _RecipesStateSuccessCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipesStateSuccessCopyWith<$R, $In extends RecipesStateSuccess, $Out>
    implements RecipesStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  RecipesStateSuccessCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipesStateSuccessCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RecipesStateSuccess, $Out>
    implements RecipesStateSuccessCopyWith<$R, RecipesStateSuccess, $Out> {
  _RecipesStateSuccessCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipesStateSuccess> $mapper = RecipesStateSuccessMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  RecipesStateSuccess $make(CopyWithData data) => RecipesStateSuccess();

  @override
  RecipesStateSuccessCopyWith<$R2, RecipesStateSuccess, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipesStateSuccessCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
