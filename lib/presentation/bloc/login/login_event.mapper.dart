// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'login_event.dart';

class LoginEventMapper extends ClassMapperBase<LoginEvent> {
  LoginEventMapper._();

  static LoginEventMapper? _instance;
  static LoginEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginEventMapper._());
      LoginEventSignInWithGoogleMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LoginEvent';

  @override
  final MappableFields<LoginEvent> fields = const {};

  static LoginEvent _instantiate(DecodingData data) {
    throw MapperException.missingSubclass('LoginEvent', 'event', '${data.value['event']}');
  }

  @override
  final Function instantiate = _instantiate;

  static LoginEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoginEvent>(map);
  }

  static LoginEvent fromJson(String json) {
    return ensureInitialized().decodeJson<LoginEvent>(json);
  }
}

mixin LoginEventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  LoginEventCopyWith<LoginEvent, LoginEvent, LoginEvent> get copyWith;
}

abstract class LoginEventCopyWith<$R, $In extends LoginEvent, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  LoginEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class LoginEventSignInWithGoogleMapper extends SubClassMapperBase<LoginEventSignInWithGoogle> {
  LoginEventSignInWithGoogleMapper._();

  static LoginEventSignInWithGoogleMapper? _instance;
  static LoginEventSignInWithGoogleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginEventSignInWithGoogleMapper._());
      LoginEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'LoginEventSignInWithGoogle';

  @override
  final MappableFields<LoginEventSignInWithGoogle> fields = const {};

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "signInWithGoogle";
  @override
  late final ClassMapperBase superMapper = LoginEventMapper.ensureInitialized();

  static LoginEventSignInWithGoogle _instantiate(DecodingData data) {
    return LoginEventSignInWithGoogle();
  }

  @override
  final Function instantiate = _instantiate;

  static LoginEventSignInWithGoogle fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoginEventSignInWithGoogle>(map);
  }

  static LoginEventSignInWithGoogle fromJson(String json) {
    return ensureInitialized().decodeJson<LoginEventSignInWithGoogle>(json);
  }
}

mixin LoginEventSignInWithGoogleMappable {
  String toJson() {
    return LoginEventSignInWithGoogleMapper.ensureInitialized().encodeJson<LoginEventSignInWithGoogle>(
      this as LoginEventSignInWithGoogle,
    );
  }

  Map<String, dynamic> toMap() {
    return LoginEventSignInWithGoogleMapper.ensureInitialized().encodeMap<LoginEventSignInWithGoogle>(
      this as LoginEventSignInWithGoogle,
    );
  }

  LoginEventSignInWithGoogleCopyWith<LoginEventSignInWithGoogle, LoginEventSignInWithGoogle, LoginEventSignInWithGoogle>
  get copyWith => _LoginEventSignInWithGoogleCopyWithImpl<LoginEventSignInWithGoogle, LoginEventSignInWithGoogle>(
    this as LoginEventSignInWithGoogle,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return LoginEventSignInWithGoogleMapper.ensureInitialized().stringifyValue(this as LoginEventSignInWithGoogle);
  }

  @override
  bool operator ==(Object other) {
    return LoginEventSignInWithGoogleMapper.ensureInitialized().equalsValue(this as LoginEventSignInWithGoogle, other);
  }

  @override
  int get hashCode {
    return LoginEventSignInWithGoogleMapper.ensureInitialized().hashValue(this as LoginEventSignInWithGoogle);
  }
}

extension LoginEventSignInWithGoogleValueCopy<$R, $Out> on ObjectCopyWith<$R, LoginEventSignInWithGoogle, $Out> {
  LoginEventSignInWithGoogleCopyWith<$R, LoginEventSignInWithGoogle, $Out> get $asLoginEventSignInWithGoogle =>
      $base.as((v, t, t2) => _LoginEventSignInWithGoogleCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LoginEventSignInWithGoogleCopyWith<$R, $In extends LoginEventSignInWithGoogle, $Out>
    implements LoginEventCopyWith<$R, $In, $Out> {
  @override
  $R call();
  LoginEventSignInWithGoogleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LoginEventSignInWithGoogleCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, LoginEventSignInWithGoogle, $Out>
    implements LoginEventSignInWithGoogleCopyWith<$R, LoginEventSignInWithGoogle, $Out> {
  _LoginEventSignInWithGoogleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoginEventSignInWithGoogle> $mapper = LoginEventSignInWithGoogleMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  LoginEventSignInWithGoogle $make(CopyWithData data) => LoginEventSignInWithGoogle();

  @override
  LoginEventSignInWithGoogleCopyWith<$R2, LoginEventSignInWithGoogle, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _LoginEventSignInWithGoogleCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
