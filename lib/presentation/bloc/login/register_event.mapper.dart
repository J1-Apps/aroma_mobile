// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'register_event.dart';

class RegisterEventMapper extends ClassMapperBase<RegisterEvent> {
  RegisterEventMapper._();

  static RegisterEventMapper? _instance;
  static RegisterEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RegisterEventMapper._());
      RegisterEventSignUpWithEmailMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RegisterEvent';

  @override
  final MappableFields<RegisterEvent> fields = const {};

  static RegisterEvent _instantiate(DecodingData data) {
    throw MapperException.missingSubclass('RegisterEvent', 'event', '${data.value['event']}');
  }

  @override
  final Function instantiate = _instantiate;

  static RegisterEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RegisterEvent>(map);
  }

  static RegisterEvent fromJson(String json) {
    return ensureInitialized().decodeJson<RegisterEvent>(json);
  }
}

mixin RegisterEventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  RegisterEventCopyWith<RegisterEvent, RegisterEvent, RegisterEvent> get copyWith;
}

abstract class RegisterEventCopyWith<$R, $In extends RegisterEvent, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  RegisterEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class RegisterEventSignUpWithEmailMapper extends SubClassMapperBase<RegisterEventSignUpWithEmail> {
  RegisterEventSignUpWithEmailMapper._();

  static RegisterEventSignUpWithEmailMapper? _instance;
  static RegisterEventSignUpWithEmailMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RegisterEventSignUpWithEmailMapper._());
      RegisterEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'RegisterEventSignUpWithEmail';

  static String _$email(RegisterEventSignUpWithEmail v) => v.email;
  static const Field<RegisterEventSignUpWithEmail, String> _f$email = Field('email', _$email);
  static String _$password(RegisterEventSignUpWithEmail v) => v.password;
  static const Field<RegisterEventSignUpWithEmail, String> _f$password = Field('password', _$password);

  @override
  final MappableFields<RegisterEventSignUpWithEmail> fields = const {
    #email: _f$email,
    #password: _f$password,
  };

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "signUpWithEmail";
  @override
  late final ClassMapperBase superMapper = RegisterEventMapper.ensureInitialized();

  static RegisterEventSignUpWithEmail _instantiate(DecodingData data) {
    return RegisterEventSignUpWithEmail(email: data.dec(_f$email), password: data.dec(_f$password));
  }

  @override
  final Function instantiate = _instantiate;

  static RegisterEventSignUpWithEmail fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RegisterEventSignUpWithEmail>(map);
  }

  static RegisterEventSignUpWithEmail fromJson(String json) {
    return ensureInitialized().decodeJson<RegisterEventSignUpWithEmail>(json);
  }
}

mixin RegisterEventSignUpWithEmailMappable {
  String toJson() {
    return RegisterEventSignUpWithEmailMapper.ensureInitialized().encodeJson<RegisterEventSignUpWithEmail>(
      this as RegisterEventSignUpWithEmail,
    );
  }

  Map<String, dynamic> toMap() {
    return RegisterEventSignUpWithEmailMapper.ensureInitialized().encodeMap<RegisterEventSignUpWithEmail>(
      this as RegisterEventSignUpWithEmail,
    );
  }

  RegisterEventSignUpWithEmailCopyWith<
    RegisterEventSignUpWithEmail,
    RegisterEventSignUpWithEmail,
    RegisterEventSignUpWithEmail
  >
  get copyWith => _RegisterEventSignUpWithEmailCopyWithImpl<RegisterEventSignUpWithEmail, RegisterEventSignUpWithEmail>(
    this as RegisterEventSignUpWithEmail,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return RegisterEventSignUpWithEmailMapper.ensureInitialized().stringifyValue(this as RegisterEventSignUpWithEmail);
  }

  @override
  bool operator ==(Object other) {
    return RegisterEventSignUpWithEmailMapper.ensureInitialized().equalsValue(
      this as RegisterEventSignUpWithEmail,
      other,
    );
  }

  @override
  int get hashCode {
    return RegisterEventSignUpWithEmailMapper.ensureInitialized().hashValue(this as RegisterEventSignUpWithEmail);
  }
}

extension RegisterEventSignUpWithEmailValueCopy<$R, $Out> on ObjectCopyWith<$R, RegisterEventSignUpWithEmail, $Out> {
  RegisterEventSignUpWithEmailCopyWith<$R, RegisterEventSignUpWithEmail, $Out> get $asRegisterEventSignUpWithEmail =>
      $base.as((v, t, t2) => _RegisterEventSignUpWithEmailCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RegisterEventSignUpWithEmailCopyWith<$R, $In extends RegisterEventSignUpWithEmail, $Out>
    implements RegisterEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? email, String? password});
  RegisterEventSignUpWithEmailCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RegisterEventSignUpWithEmailCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RegisterEventSignUpWithEmail, $Out>
    implements RegisterEventSignUpWithEmailCopyWith<$R, RegisterEventSignUpWithEmail, $Out> {
  _RegisterEventSignUpWithEmailCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RegisterEventSignUpWithEmail> $mapper =
      RegisterEventSignUpWithEmailMapper.ensureInitialized();
  @override
  $R call({String? email, String? password}) =>
      $apply(FieldCopyWithData({if (email != null) #email: email, if (password != null) #password: password}));
  @override
  RegisterEventSignUpWithEmail $make(CopyWithData data) => RegisterEventSignUpWithEmail(
    email: data.get(#email, or: $value.email),
    password: data.get(#password, or: $value.password),
  );

  @override
  RegisterEventSignUpWithEmailCopyWith<$R2, RegisterEventSignUpWithEmail, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RegisterEventSignUpWithEmailCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
