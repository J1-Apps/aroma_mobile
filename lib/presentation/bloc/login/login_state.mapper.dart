// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'login_state.dart';

class LoginStateMapper extends ClassMapperBase<LoginState> {
  LoginStateMapper._();

  static LoginStateMapper? _instance;
  static LoginStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginStateMapper._());
      ErrorCodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LoginState';

  static bool _$isLoading(LoginState v) => v.isLoading;
  static const Field<LoginState, bool> _f$isLoading = Field('isLoading', _$isLoading, opt: true, def: false);
  static ErrorCode? _$error(LoginState v) => v.error;
  static const Field<LoginState, ErrorCode> _f$error = Field('error', _$error, opt: true);

  @override
  final MappableFields<LoginState> fields = const {
    #isLoading: _f$isLoading,
    #error: _f$error,
  };

  static LoginState _instantiate(DecodingData data) {
    return LoginState(isLoading: data.dec(_f$isLoading), error: data.dec(_f$error));
  }

  @override
  final Function instantiate = _instantiate;

  static LoginState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoginState>(map);
  }

  static LoginState fromJson(String json) {
    return ensureInitialized().decodeJson<LoginState>(json);
  }
}

mixin LoginStateMappable {
  String toJson() {
    return LoginStateMapper.ensureInitialized().encodeJson<LoginState>(this as LoginState);
  }

  Map<String, dynamic> toMap() {
    return LoginStateMapper.ensureInitialized().encodeMap<LoginState>(this as LoginState);
  }

  LoginStateCopyWith<LoginState, LoginState, LoginState> get copyWith =>
      _LoginStateCopyWithImpl<LoginState, LoginState>(this as LoginState, $identity, $identity);
  @override
  String toString() {
    return LoginStateMapper.ensureInitialized().stringifyValue(this as LoginState);
  }

  @override
  bool operator ==(Object other) {
    return LoginStateMapper.ensureInitialized().equalsValue(this as LoginState, other);
  }

  @override
  int get hashCode {
    return LoginStateMapper.ensureInitialized().hashValue(this as LoginState);
  }
}

extension LoginStateValueCopy<$R, $Out> on ObjectCopyWith<$R, LoginState, $Out> {
  LoginStateCopyWith<$R, LoginState, $Out> get $asLoginState =>
      $base.as((v, t, t2) => _LoginStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LoginStateCopyWith<$R, $In extends LoginState, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? isLoading, ErrorCode? error});
  LoginStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LoginStateCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, LoginState, $Out>
    implements LoginStateCopyWith<$R, LoginState, $Out> {
  _LoginStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoginState> $mapper = LoginStateMapper.ensureInitialized();
  @override
  $R call({bool? isLoading, Object? error = $none}) =>
      $apply(FieldCopyWithData({if (isLoading != null) #isLoading: isLoading, if (error != $none) #error: error}));
  @override
  LoginState $make(CopyWithData data) => LoginState(
    isLoading: data.get(#isLoading, or: $value.isLoading),
    error: data.get(#error, or: $value.error),
  );

  @override
  LoginStateCopyWith<$R2, LoginState, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _LoginStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
