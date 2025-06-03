// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth_entity.dart';

class AuthEntityMapper extends ClassMapperBase<AuthEntity> {
  AuthEntityMapper._();

  static AuthEntityMapper? _instance;
  static AuthEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthEntityMapper._());
      AuthEntitySignedInMapper.ensureInitialized();
      AuthEntitySignedOutMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AuthEntity';

  @override
  final MappableFields<AuthEntity> fields = const {};

  static AuthEntity _instantiate(DecodingData data) {
    throw MapperException.missingSubclass('AuthEntity', 'status', '${data.value['status']}');
  }

  @override
  final Function instantiate = _instantiate;

  static AuthEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthEntity>(map);
  }

  static AuthEntity fromJson(String json) {
    return ensureInitialized().decodeJson<AuthEntity>(json);
  }
}

mixin AuthEntityMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AuthEntityCopyWith<AuthEntity, AuthEntity, AuthEntity> get copyWith;
}

abstract class AuthEntityCopyWith<$R, $In extends AuthEntity, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  AuthEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class AuthEntitySignedInMapper extends SubClassMapperBase<AuthEntitySignedIn> {
  AuthEntitySignedInMapper._();

  static AuthEntitySignedInMapper? _instance;
  static AuthEntitySignedInMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthEntitySignedInMapper._());
      AuthEntityMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'AuthEntitySignedIn';

  static String _$userId(AuthEntitySignedIn v) => v.userId;
  static const Field<AuthEntitySignedIn, String> _f$userId = Field('userId', _$userId);

  @override
  final MappableFields<AuthEntitySignedIn> fields = const {
    #userId: _f$userId,
  };

  @override
  final String discriminatorKey = 'status';
  @override
  final dynamic discriminatorValue = "signed_in";
  @override
  late final ClassMapperBase superMapper = AuthEntityMapper.ensureInitialized();

  static AuthEntitySignedIn _instantiate(DecodingData data) {
    return AuthEntitySignedIn(userId: data.dec(_f$userId));
  }

  @override
  final Function instantiate = _instantiate;

  static AuthEntitySignedIn fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthEntitySignedIn>(map);
  }

  static AuthEntitySignedIn fromJson(String json) {
    return ensureInitialized().decodeJson<AuthEntitySignedIn>(json);
  }
}

mixin AuthEntitySignedInMappable {
  String toJson() {
    return AuthEntitySignedInMapper.ensureInitialized().encodeJson<AuthEntitySignedIn>(this as AuthEntitySignedIn);
  }

  Map<String, dynamic> toMap() {
    return AuthEntitySignedInMapper.ensureInitialized().encodeMap<AuthEntitySignedIn>(this as AuthEntitySignedIn);
  }

  AuthEntitySignedInCopyWith<AuthEntitySignedIn, AuthEntitySignedIn, AuthEntitySignedIn> get copyWith =>
      _AuthEntitySignedInCopyWithImpl<AuthEntitySignedIn, AuthEntitySignedIn>(
        this as AuthEntitySignedIn,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AuthEntitySignedInMapper.ensureInitialized().stringifyValue(this as AuthEntitySignedIn);
  }

  @override
  bool operator ==(Object other) {
    return AuthEntitySignedInMapper.ensureInitialized().equalsValue(this as AuthEntitySignedIn, other);
  }

  @override
  int get hashCode {
    return AuthEntitySignedInMapper.ensureInitialized().hashValue(this as AuthEntitySignedIn);
  }
}

extension AuthEntitySignedInValueCopy<$R, $Out> on ObjectCopyWith<$R, AuthEntitySignedIn, $Out> {
  AuthEntitySignedInCopyWith<$R, AuthEntitySignedIn, $Out> get $asAuthEntitySignedIn =>
      $base.as((v, t, t2) => _AuthEntitySignedInCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AuthEntitySignedInCopyWith<$R, $In extends AuthEntitySignedIn, $Out>
    implements AuthEntityCopyWith<$R, $In, $Out> {
  @override
  $R call({String? userId});
  AuthEntitySignedInCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AuthEntitySignedInCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, AuthEntitySignedIn, $Out>
    implements AuthEntitySignedInCopyWith<$R, AuthEntitySignedIn, $Out> {
  _AuthEntitySignedInCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuthEntitySignedIn> $mapper = AuthEntitySignedInMapper.ensureInitialized();
  @override
  $R call({String? userId}) => $apply(FieldCopyWithData({if (userId != null) #userId: userId}));
  @override
  AuthEntitySignedIn $make(CopyWithData data) => AuthEntitySignedIn(userId: data.get(#userId, or: $value.userId));

  @override
  AuthEntitySignedInCopyWith<$R2, AuthEntitySignedIn, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AuthEntitySignedInCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AuthEntitySignedOutMapper extends SubClassMapperBase<AuthEntitySignedOut> {
  AuthEntitySignedOutMapper._();

  static AuthEntitySignedOutMapper? _instance;
  static AuthEntitySignedOutMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthEntitySignedOutMapper._());
      AuthEntityMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'AuthEntitySignedOut';

  @override
  final MappableFields<AuthEntitySignedOut> fields = const {};

  @override
  final String discriminatorKey = 'status';
  @override
  final dynamic discriminatorValue = "signed_out";
  @override
  late final ClassMapperBase superMapper = AuthEntityMapper.ensureInitialized();

  static AuthEntitySignedOut _instantiate(DecodingData data) {
    return AuthEntitySignedOut();
  }

  @override
  final Function instantiate = _instantiate;

  static AuthEntitySignedOut fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthEntitySignedOut>(map);
  }

  static AuthEntitySignedOut fromJson(String json) {
    return ensureInitialized().decodeJson<AuthEntitySignedOut>(json);
  }
}

mixin AuthEntitySignedOutMappable {
  String toJson() {
    return AuthEntitySignedOutMapper.ensureInitialized().encodeJson<AuthEntitySignedOut>(this as AuthEntitySignedOut);
  }

  Map<String, dynamic> toMap() {
    return AuthEntitySignedOutMapper.ensureInitialized().encodeMap<AuthEntitySignedOut>(this as AuthEntitySignedOut);
  }

  AuthEntitySignedOutCopyWith<AuthEntitySignedOut, AuthEntitySignedOut, AuthEntitySignedOut> get copyWith =>
      _AuthEntitySignedOutCopyWithImpl<AuthEntitySignedOut, AuthEntitySignedOut>(
        this as AuthEntitySignedOut,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AuthEntitySignedOutMapper.ensureInitialized().stringifyValue(this as AuthEntitySignedOut);
  }

  @override
  bool operator ==(Object other) {
    return AuthEntitySignedOutMapper.ensureInitialized().equalsValue(this as AuthEntitySignedOut, other);
  }

  @override
  int get hashCode {
    return AuthEntitySignedOutMapper.ensureInitialized().hashValue(this as AuthEntitySignedOut);
  }
}

extension AuthEntitySignedOutValueCopy<$R, $Out> on ObjectCopyWith<$R, AuthEntitySignedOut, $Out> {
  AuthEntitySignedOutCopyWith<$R, AuthEntitySignedOut, $Out> get $asAuthEntitySignedOut =>
      $base.as((v, t, t2) => _AuthEntitySignedOutCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AuthEntitySignedOutCopyWith<$R, $In extends AuthEntitySignedOut, $Out>
    implements AuthEntityCopyWith<$R, $In, $Out> {
  @override
  $R call();
  AuthEntitySignedOutCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AuthEntitySignedOutCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, AuthEntitySignedOut, $Out>
    implements AuthEntitySignedOutCopyWith<$R, AuthEntitySignedOut, $Out> {
  _AuthEntitySignedOutCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuthEntitySignedOut> $mapper = AuthEntitySignedOutMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  AuthEntitySignedOut $make(CopyWithData data) => AuthEntitySignedOut();

  @override
  AuthEntitySignedOutCopyWith<$R2, AuthEntitySignedOut, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AuthEntitySignedOutCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
