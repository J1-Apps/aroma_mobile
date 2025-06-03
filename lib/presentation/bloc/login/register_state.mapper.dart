// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'register_state.dart';

class RegisterStateMapper extends ClassMapperBase<RegisterState> {
  RegisterStateMapper._();

  static RegisterStateMapper? _instance;
  static RegisterStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RegisterStateMapper._());
      ErrorCodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RegisterState';

  static bool _$isLoading(RegisterState v) => v.isLoading;
  static const Field<RegisterState, bool> _f$isLoading = Field('isLoading', _$isLoading, opt: true, def: false);
  static ErrorCode? _$error(RegisterState v) => v.error;
  static const Field<RegisterState, ErrorCode> _f$error = Field('error', _$error, opt: true);

  @override
  final MappableFields<RegisterState> fields = const {
    #isLoading: _f$isLoading,
    #error: _f$error,
  };

  static RegisterState _instantiate(DecodingData data) {
    return RegisterState(isLoading: data.dec(_f$isLoading), error: data.dec(_f$error));
  }

  @override
  final Function instantiate = _instantiate;

  static RegisterState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RegisterState>(map);
  }

  static RegisterState fromJson(String json) {
    return ensureInitialized().decodeJson<RegisterState>(json);
  }
}

mixin RegisterStateMappable {
  String toJson() {
    return RegisterStateMapper.ensureInitialized().encodeJson<RegisterState>(this as RegisterState);
  }

  Map<String, dynamic> toMap() {
    return RegisterStateMapper.ensureInitialized().encodeMap<RegisterState>(this as RegisterState);
  }

  RegisterStateCopyWith<RegisterState, RegisterState, RegisterState> get copyWith =>
      _RegisterStateCopyWithImpl<RegisterState, RegisterState>(this as RegisterState, $identity, $identity);
  @override
  String toString() {
    return RegisterStateMapper.ensureInitialized().stringifyValue(this as RegisterState);
  }

  @override
  bool operator ==(Object other) {
    return RegisterStateMapper.ensureInitialized().equalsValue(this as RegisterState, other);
  }

  @override
  int get hashCode {
    return RegisterStateMapper.ensureInitialized().hashValue(this as RegisterState);
  }
}

extension RegisterStateValueCopy<$R, $Out> on ObjectCopyWith<$R, RegisterState, $Out> {
  RegisterStateCopyWith<$R, RegisterState, $Out> get $asRegisterState =>
      $base.as((v, t, t2) => _RegisterStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RegisterStateCopyWith<$R, $In extends RegisterState, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? isLoading, ErrorCode? error});
  RegisterStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RegisterStateCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RegisterState, $Out>
    implements RegisterStateCopyWith<$R, RegisterState, $Out> {
  _RegisterStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RegisterState> $mapper = RegisterStateMapper.ensureInitialized();
  @override
  $R call({bool? isLoading, Object? error = $none}) =>
      $apply(FieldCopyWithData({if (isLoading != null) #isLoading: isLoading, if (error != $none) #error: error}));
  @override
  RegisterState $make(CopyWithData data) => RegisterState(
    isLoading: data.get(#isLoading, or: $value.isLoading),
    error: data.get(#error, or: $value.error),
  );

  @override
  RegisterStateCopyWith<$R2, RegisterState, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RegisterStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
