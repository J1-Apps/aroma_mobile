// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'reset_password_state.dart';

class ResetPasswordStateMapper extends ClassMapperBase<ResetPasswordState> {
  ResetPasswordStateMapper._();

  static ResetPasswordStateMapper? _instance;
  static ResetPasswordStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ResetPasswordStateMapper._());
      ErrorCodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ResetPasswordState';

  static bool _$isLoading(ResetPasswordState v) => v.isLoading;
  static const Field<ResetPasswordState, bool> _f$isLoading = Field('isLoading', _$isLoading, opt: true, def: false);
  static bool _$isSuccess(ResetPasswordState v) => v.isSuccess;
  static const Field<ResetPasswordState, bool> _f$isSuccess = Field('isSuccess', _$isSuccess, opt: true, def: false);
  static ErrorCode? _$error(ResetPasswordState v) => v.error;
  static const Field<ResetPasswordState, ErrorCode> _f$error = Field('error', _$error, opt: true);

  @override
  final MappableFields<ResetPasswordState> fields = const {
    #isLoading: _f$isLoading,
    #isSuccess: _f$isSuccess,
    #error: _f$error,
  };

  static ResetPasswordState _instantiate(DecodingData data) {
    return ResetPasswordState(
      isLoading: data.dec(_f$isLoading),
      isSuccess: data.dec(_f$isSuccess),
      error: data.dec(_f$error),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ResetPasswordState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ResetPasswordState>(map);
  }

  static ResetPasswordState fromJson(String json) {
    return ensureInitialized().decodeJson<ResetPasswordState>(json);
  }
}

mixin ResetPasswordStateMappable {
  String toJson() {
    return ResetPasswordStateMapper.ensureInitialized().encodeJson<ResetPasswordState>(this as ResetPasswordState);
  }

  Map<String, dynamic> toMap() {
    return ResetPasswordStateMapper.ensureInitialized().encodeMap<ResetPasswordState>(this as ResetPasswordState);
  }

  ResetPasswordStateCopyWith<ResetPasswordState, ResetPasswordState, ResetPasswordState> get copyWith =>
      _ResetPasswordStateCopyWithImpl<ResetPasswordState, ResetPasswordState>(
        this as ResetPasswordState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ResetPasswordStateMapper.ensureInitialized().stringifyValue(this as ResetPasswordState);
  }

  @override
  bool operator ==(Object other) {
    return ResetPasswordStateMapper.ensureInitialized().equalsValue(this as ResetPasswordState, other);
  }

  @override
  int get hashCode {
    return ResetPasswordStateMapper.ensureInitialized().hashValue(this as ResetPasswordState);
  }
}

extension ResetPasswordStateValueCopy<$R, $Out> on ObjectCopyWith<$R, ResetPasswordState, $Out> {
  ResetPasswordStateCopyWith<$R, ResetPasswordState, $Out> get $asResetPasswordState =>
      $base.as((v, t, t2) => _ResetPasswordStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ResetPasswordStateCopyWith<$R, $In extends ResetPasswordState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? isLoading, bool? isSuccess, ErrorCode? error});
  ResetPasswordStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ResetPasswordStateCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, ResetPasswordState, $Out>
    implements ResetPasswordStateCopyWith<$R, ResetPasswordState, $Out> {
  _ResetPasswordStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ResetPasswordState> $mapper = ResetPasswordStateMapper.ensureInitialized();
  @override
  $R call({bool? isLoading, bool? isSuccess, Object? error = $none}) => $apply(
    FieldCopyWithData({
      if (isLoading != null) #isLoading: isLoading,
      if (isSuccess != null) #isSuccess: isSuccess,
      if (error != $none) #error: error,
    }),
  );
  @override
  ResetPasswordState $make(CopyWithData data) => ResetPasswordState(
    isLoading: data.get(#isLoading, or: $value.isLoading),
    isSuccess: data.get(#isSuccess, or: $value.isSuccess),
    error: data.get(#error, or: $value.error),
  );

  @override
  ResetPasswordStateCopyWith<$R2, ResetPasswordState, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ResetPasswordStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
