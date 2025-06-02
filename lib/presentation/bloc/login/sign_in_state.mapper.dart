// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sign_in_state.dart';

class SignInStateMapper extends ClassMapperBase<SignInState> {
  SignInStateMapper._();

  static SignInStateMapper? _instance;
  static SignInStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SignInStateMapper._());
      ErrorCodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SignInState';

  static bool _$isLoading(SignInState v) => v.isLoading;
  static const Field<SignInState, bool> _f$isLoading = Field('isLoading', _$isLoading, opt: true, def: false);
  static ErrorCode? _$error(SignInState v) => v.error;
  static const Field<SignInState, ErrorCode> _f$error = Field('error', _$error, opt: true);

  @override
  final MappableFields<SignInState> fields = const {
    #isLoading: _f$isLoading,
    #error: _f$error,
  };

  static SignInState _instantiate(DecodingData data) {
    return SignInState(isLoading: data.dec(_f$isLoading), error: data.dec(_f$error));
  }

  @override
  final Function instantiate = _instantiate;

  static SignInState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SignInState>(map);
  }

  static SignInState fromJson(String json) {
    return ensureInitialized().decodeJson<SignInState>(json);
  }
}

mixin SignInStateMappable {
  String toJson() {
    return SignInStateMapper.ensureInitialized().encodeJson<SignInState>(this as SignInState);
  }

  Map<String, dynamic> toMap() {
    return SignInStateMapper.ensureInitialized().encodeMap<SignInState>(this as SignInState);
  }

  SignInStateCopyWith<SignInState, SignInState, SignInState> get copyWith =>
      _SignInStateCopyWithImpl<SignInState, SignInState>(this as SignInState, $identity, $identity);
  @override
  String toString() {
    return SignInStateMapper.ensureInitialized().stringifyValue(this as SignInState);
  }

  @override
  bool operator ==(Object other) {
    return SignInStateMapper.ensureInitialized().equalsValue(this as SignInState, other);
  }

  @override
  int get hashCode {
    return SignInStateMapper.ensureInitialized().hashValue(this as SignInState);
  }
}

extension SignInStateValueCopy<$R, $Out> on ObjectCopyWith<$R, SignInState, $Out> {
  SignInStateCopyWith<$R, SignInState, $Out> get $asSignInState =>
      $base.as((v, t, t2) => _SignInStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SignInStateCopyWith<$R, $In extends SignInState, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? isLoading, ErrorCode? error});
  SignInStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SignInStateCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, SignInState, $Out>
    implements SignInStateCopyWith<$R, SignInState, $Out> {
  _SignInStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SignInState> $mapper = SignInStateMapper.ensureInitialized();
  @override
  $R call({bool? isLoading, Object? error = $none}) =>
      $apply(FieldCopyWithData({if (isLoading != null) #isLoading: isLoading, if (error != $none) #error: error}));
  @override
  SignInState $make(CopyWithData data) => SignInState(
    isLoading: data.get(#isLoading, or: $value.isLoading),
    error: data.get(#error, or: $value.error),
  );

  @override
  SignInStateCopyWith<$R2, SignInState, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SignInStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
