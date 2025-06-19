// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sign_in_event.dart';

class SignInEventMapper extends ClassMapperBase<SignInEvent> {
  SignInEventMapper._();

  static SignInEventMapper? _instance;
  static SignInEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SignInEventMapper._());
      SignInEventSignInWithEmailMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SignInEvent';

  @override
  final MappableFields<SignInEvent> fields = const {};

  static SignInEvent _instantiate(DecodingData data) {
    throw MapperException.missingSubclass('SignInEvent', 'event', '${data.value['event']}');
  }

  @override
  final Function instantiate = _instantiate;

  static SignInEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SignInEvent>(map);
  }

  static SignInEvent fromJson(String json) {
    return ensureInitialized().decodeJson<SignInEvent>(json);
  }
}

mixin SignInEventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  SignInEventCopyWith<SignInEvent, SignInEvent, SignInEvent> get copyWith;
}

abstract class SignInEventCopyWith<$R, $In extends SignInEvent, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  SignInEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class SignInEventSignInWithEmailMapper extends SubClassMapperBase<SignInEventSignInWithEmail> {
  SignInEventSignInWithEmailMapper._();

  static SignInEventSignInWithEmailMapper? _instance;
  static SignInEventSignInWithEmailMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SignInEventSignInWithEmailMapper._());
      SignInEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'SignInEventSignInWithEmail';

  static String _$email(SignInEventSignInWithEmail v) => v.email;
  static const Field<SignInEventSignInWithEmail, String> _f$email = Field('email', _$email);
  static String _$password(SignInEventSignInWithEmail v) => v.password;
  static const Field<SignInEventSignInWithEmail, String> _f$password = Field('password', _$password);

  @override
  final MappableFields<SignInEventSignInWithEmail> fields = const {
    #email: _f$email,
    #password: _f$password,
  };

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "signInWithEmail";
  @override
  late final ClassMapperBase superMapper = SignInEventMapper.ensureInitialized();

  static SignInEventSignInWithEmail _instantiate(DecodingData data) {
    return SignInEventSignInWithEmail(email: data.dec(_f$email), password: data.dec(_f$password));
  }

  @override
  final Function instantiate = _instantiate;

  static SignInEventSignInWithEmail fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SignInEventSignInWithEmail>(map);
  }

  static SignInEventSignInWithEmail fromJson(String json) {
    return ensureInitialized().decodeJson<SignInEventSignInWithEmail>(json);
  }
}

mixin SignInEventSignInWithEmailMappable {
  String toJson() {
    return SignInEventSignInWithEmailMapper.ensureInitialized().encodeJson<SignInEventSignInWithEmail>(
      this as SignInEventSignInWithEmail,
    );
  }

  Map<String, dynamic> toMap() {
    return SignInEventSignInWithEmailMapper.ensureInitialized().encodeMap<SignInEventSignInWithEmail>(
      this as SignInEventSignInWithEmail,
    );
  }

  SignInEventSignInWithEmailCopyWith<SignInEventSignInWithEmail, SignInEventSignInWithEmail, SignInEventSignInWithEmail>
  get copyWith => _SignInEventSignInWithEmailCopyWithImpl<SignInEventSignInWithEmail, SignInEventSignInWithEmail>(
    this as SignInEventSignInWithEmail,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return SignInEventSignInWithEmailMapper.ensureInitialized().stringifyValue(this as SignInEventSignInWithEmail);
  }

  @override
  bool operator ==(Object other) {
    return SignInEventSignInWithEmailMapper.ensureInitialized().equalsValue(this as SignInEventSignInWithEmail, other);
  }

  @override
  int get hashCode {
    return SignInEventSignInWithEmailMapper.ensureInitialized().hashValue(this as SignInEventSignInWithEmail);
  }
}

extension SignInEventSignInWithEmailValueCopy<$R, $Out> on ObjectCopyWith<$R, SignInEventSignInWithEmail, $Out> {
  SignInEventSignInWithEmailCopyWith<$R, SignInEventSignInWithEmail, $Out> get $asSignInEventSignInWithEmail =>
      $base.as((v, t, t2) => _SignInEventSignInWithEmailCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SignInEventSignInWithEmailCopyWith<$R, $In extends SignInEventSignInWithEmail, $Out>
    implements SignInEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? email, String? password});
  SignInEventSignInWithEmailCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SignInEventSignInWithEmailCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, SignInEventSignInWithEmail, $Out>
    implements SignInEventSignInWithEmailCopyWith<$R, SignInEventSignInWithEmail, $Out> {
  _SignInEventSignInWithEmailCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SignInEventSignInWithEmail> $mapper = SignInEventSignInWithEmailMapper.ensureInitialized();
  @override
  $R call({String? email, String? password}) =>
      $apply(FieldCopyWithData({if (email != null) #email: email, if (password != null) #password: password}));
  @override
  SignInEventSignInWithEmail $make(CopyWithData data) => SignInEventSignInWithEmail(
    email: data.get(#email, or: $value.email),
    password: data.get(#password, or: $value.password),
  );

  @override
  SignInEventSignInWithEmailCopyWith<$R2, SignInEventSignInWithEmail, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SignInEventSignInWithEmailCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
