// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'reset_password_event.dart';

class ResetPasswordEventMapper extends ClassMapperBase<ResetPasswordEvent> {
  ResetPasswordEventMapper._();

  static ResetPasswordEventMapper? _instance;
  static ResetPasswordEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ResetPasswordEventMapper._());
      ResetPasswordEventResetPasswordMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ResetPasswordEvent';

  @override
  final MappableFields<ResetPasswordEvent> fields = const {};

  static ResetPasswordEvent _instantiate(DecodingData data) {
    throw MapperException.missingSubclass('ResetPasswordEvent', 'event', '${data.value['event']}');
  }

  @override
  final Function instantiate = _instantiate;

  static ResetPasswordEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ResetPasswordEvent>(map);
  }

  static ResetPasswordEvent fromJson(String json) {
    return ensureInitialized().decodeJson<ResetPasswordEvent>(json);
  }
}

mixin ResetPasswordEventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  ResetPasswordEventCopyWith<ResetPasswordEvent, ResetPasswordEvent, ResetPasswordEvent> get copyWith;
}

abstract class ResetPasswordEventCopyWith<$R, $In extends ResetPasswordEvent, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  ResetPasswordEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class ResetPasswordEventResetPasswordMapper extends SubClassMapperBase<ResetPasswordEventResetPassword> {
  ResetPasswordEventResetPasswordMapper._();

  static ResetPasswordEventResetPasswordMapper? _instance;
  static ResetPasswordEventResetPasswordMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ResetPasswordEventResetPasswordMapper._());
      ResetPasswordEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'ResetPasswordEventResetPassword';

  static String _$email(ResetPasswordEventResetPassword v) => v.email;
  static const Field<ResetPasswordEventResetPassword, String> _f$email = Field('email', _$email);

  @override
  final MappableFields<ResetPasswordEventResetPassword> fields = const {
    #email: _f$email,
  };

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "resetPassword";
  @override
  late final ClassMapperBase superMapper = ResetPasswordEventMapper.ensureInitialized();

  static ResetPasswordEventResetPassword _instantiate(DecodingData data) {
    return ResetPasswordEventResetPassword(email: data.dec(_f$email));
  }

  @override
  final Function instantiate = _instantiate;

  static ResetPasswordEventResetPassword fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ResetPasswordEventResetPassword>(map);
  }

  static ResetPasswordEventResetPassword fromJson(String json) {
    return ensureInitialized().decodeJson<ResetPasswordEventResetPassword>(json);
  }
}

mixin ResetPasswordEventResetPasswordMappable {
  String toJson() {
    return ResetPasswordEventResetPasswordMapper.ensureInitialized().encodeJson<ResetPasswordEventResetPassword>(
      this as ResetPasswordEventResetPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return ResetPasswordEventResetPasswordMapper.ensureInitialized().encodeMap<ResetPasswordEventResetPassword>(
      this as ResetPasswordEventResetPassword,
    );
  }

  ResetPasswordEventResetPasswordCopyWith<
    ResetPasswordEventResetPassword,
    ResetPasswordEventResetPassword,
    ResetPasswordEventResetPassword
  >
  get copyWith =>
      _ResetPasswordEventResetPasswordCopyWithImpl<ResetPasswordEventResetPassword, ResetPasswordEventResetPassword>(
        this as ResetPasswordEventResetPassword,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ResetPasswordEventResetPasswordMapper.ensureInitialized().stringifyValue(
      this as ResetPasswordEventResetPassword,
    );
  }

  @override
  bool operator ==(Object other) {
    return ResetPasswordEventResetPasswordMapper.ensureInitialized().equalsValue(
      this as ResetPasswordEventResetPassword,
      other,
    );
  }

  @override
  int get hashCode {
    return ResetPasswordEventResetPasswordMapper.ensureInitialized().hashValue(this as ResetPasswordEventResetPassword);
  }
}

extension ResetPasswordEventResetPasswordValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ResetPasswordEventResetPassword, $Out> {
  ResetPasswordEventResetPasswordCopyWith<$R, ResetPasswordEventResetPassword, $Out>
  get $asResetPasswordEventResetPassword =>
      $base.as((v, t, t2) => _ResetPasswordEventResetPasswordCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ResetPasswordEventResetPasswordCopyWith<$R, $In extends ResetPasswordEventResetPassword, $Out>
    implements ResetPasswordEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? email});
  ResetPasswordEventResetPasswordCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ResetPasswordEventResetPasswordCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ResetPasswordEventResetPassword, $Out>
    implements ResetPasswordEventResetPasswordCopyWith<$R, ResetPasswordEventResetPassword, $Out> {
  _ResetPasswordEventResetPasswordCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ResetPasswordEventResetPassword> $mapper =
      ResetPasswordEventResetPasswordMapper.ensureInitialized();
  @override
  $R call({String? email}) => $apply(FieldCopyWithData({if (email != null) #email: email}));
  @override
  ResetPasswordEventResetPassword $make(CopyWithData data) =>
      ResetPasswordEventResetPassword(email: data.get(#email, or: $value.email));

  @override
  ResetPasswordEventResetPasswordCopyWith<$R2, ResetPasswordEventResetPassword, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ResetPasswordEventResetPasswordCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
