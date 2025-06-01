// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'session_model.dart';

class SessionModelMapper extends ClassMapperBase<SessionModel> {
  SessionModelMapper._();

  static SessionModelMapper? _instance;
  static SessionModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SessionModelMapper._());
      SessionModelSignedInMapper.ensureInitialized();
      SessionModelSignedOutMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SessionModel';

  @override
  final MappableFields<SessionModel> fields = const {};

  static SessionModel _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('SessionModel');
  }

  @override
  final Function instantiate = _instantiate;

  static SessionModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SessionModel>(map);
  }

  static SessionModel fromJson(String json) {
    return ensureInitialized().decodeJson<SessionModel>(json);
  }
}

mixin SessionModelMappable {
  String toJson();
  Map<String, dynamic> toMap();
  SessionModelCopyWith<SessionModel, SessionModel, SessionModel> get copyWith;
}

abstract class SessionModelCopyWith<$R, $In extends SessionModel, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  SessionModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class SessionModelSignedInMapper extends SubClassMapperBase<SessionModelSignedIn> {
  SessionModelSignedInMapper._();

  static SessionModelSignedInMapper? _instance;
  static SessionModelSignedInMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SessionModelSignedInMapper._());
      SessionModelMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'SessionModelSignedIn';

  static String _$userId(SessionModelSignedIn v) => v.userId;
  static const Field<SessionModelSignedIn, String> _f$userId = Field('userId', _$userId);

  @override
  final MappableFields<SessionModelSignedIn> fields = const {
    #userId: _f$userId,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = "signed_in";
  @override
  late final ClassMapperBase superMapper = SessionModelMapper.ensureInitialized();

  static SessionModelSignedIn _instantiate(DecodingData data) {
    return SessionModelSignedIn(userId: data.dec(_f$userId));
  }

  @override
  final Function instantiate = _instantiate;

  static SessionModelSignedIn fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SessionModelSignedIn>(map);
  }

  static SessionModelSignedIn fromJson(String json) {
    return ensureInitialized().decodeJson<SessionModelSignedIn>(json);
  }
}

mixin SessionModelSignedInMappable {
  String toJson() {
    return SessionModelSignedInMapper.ensureInitialized().encodeJson<SessionModelSignedIn>(
      this as SessionModelSignedIn,
    );
  }

  Map<String, dynamic> toMap() {
    return SessionModelSignedInMapper.ensureInitialized().encodeMap<SessionModelSignedIn>(this as SessionModelSignedIn);
  }

  SessionModelSignedInCopyWith<SessionModelSignedIn, SessionModelSignedIn, SessionModelSignedIn> get copyWith =>
      _SessionModelSignedInCopyWithImpl<SessionModelSignedIn, SessionModelSignedIn>(
        this as SessionModelSignedIn,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SessionModelSignedInMapper.ensureInitialized().stringifyValue(this as SessionModelSignedIn);
  }

  @override
  bool operator ==(Object other) {
    return SessionModelSignedInMapper.ensureInitialized().equalsValue(this as SessionModelSignedIn, other);
  }

  @override
  int get hashCode {
    return SessionModelSignedInMapper.ensureInitialized().hashValue(this as SessionModelSignedIn);
  }
}

extension SessionModelSignedInValueCopy<$R, $Out> on ObjectCopyWith<$R, SessionModelSignedIn, $Out> {
  SessionModelSignedInCopyWith<$R, SessionModelSignedIn, $Out> get $asSessionModelSignedIn =>
      $base.as((v, t, t2) => _SessionModelSignedInCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SessionModelSignedInCopyWith<$R, $In extends SessionModelSignedIn, $Out>
    implements SessionModelCopyWith<$R, $In, $Out> {
  @override
  $R call({String? userId});
  SessionModelSignedInCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SessionModelSignedInCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, SessionModelSignedIn, $Out>
    implements SessionModelSignedInCopyWith<$R, SessionModelSignedIn, $Out> {
  _SessionModelSignedInCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SessionModelSignedIn> $mapper = SessionModelSignedInMapper.ensureInitialized();
  @override
  $R call({String? userId}) => $apply(FieldCopyWithData({if (userId != null) #userId: userId}));
  @override
  SessionModelSignedIn $make(CopyWithData data) => SessionModelSignedIn(userId: data.get(#userId, or: $value.userId));

  @override
  SessionModelSignedInCopyWith<$R2, SessionModelSignedIn, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SessionModelSignedInCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SessionModelSignedOutMapper extends SubClassMapperBase<SessionModelSignedOut> {
  SessionModelSignedOutMapper._();

  static SessionModelSignedOutMapper? _instance;
  static SessionModelSignedOutMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SessionModelSignedOutMapper._());
      SessionModelMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'SessionModelSignedOut';

  @override
  final MappableFields<SessionModelSignedOut> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = "signed_out";
  @override
  late final ClassMapperBase superMapper = SessionModelMapper.ensureInitialized();

  static SessionModelSignedOut _instantiate(DecodingData data) {
    return SessionModelSignedOut();
  }

  @override
  final Function instantiate = _instantiate;

  static SessionModelSignedOut fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SessionModelSignedOut>(map);
  }

  static SessionModelSignedOut fromJson(String json) {
    return ensureInitialized().decodeJson<SessionModelSignedOut>(json);
  }
}

mixin SessionModelSignedOutMappable {
  String toJson() {
    return SessionModelSignedOutMapper.ensureInitialized().encodeJson<SessionModelSignedOut>(
      this as SessionModelSignedOut,
    );
  }

  Map<String, dynamic> toMap() {
    return SessionModelSignedOutMapper.ensureInitialized().encodeMap<SessionModelSignedOut>(
      this as SessionModelSignedOut,
    );
  }

  SessionModelSignedOutCopyWith<SessionModelSignedOut, SessionModelSignedOut, SessionModelSignedOut> get copyWith =>
      _SessionModelSignedOutCopyWithImpl<SessionModelSignedOut, SessionModelSignedOut>(
        this as SessionModelSignedOut,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SessionModelSignedOutMapper.ensureInitialized().stringifyValue(this as SessionModelSignedOut);
  }

  @override
  bool operator ==(Object other) {
    return SessionModelSignedOutMapper.ensureInitialized().equalsValue(this as SessionModelSignedOut, other);
  }

  @override
  int get hashCode {
    return SessionModelSignedOutMapper.ensureInitialized().hashValue(this as SessionModelSignedOut);
  }
}

extension SessionModelSignedOutValueCopy<$R, $Out> on ObjectCopyWith<$R, SessionModelSignedOut, $Out> {
  SessionModelSignedOutCopyWith<$R, SessionModelSignedOut, $Out> get $asSessionModelSignedOut =>
      $base.as((v, t, t2) => _SessionModelSignedOutCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SessionModelSignedOutCopyWith<$R, $In extends SessionModelSignedOut, $Out>
    implements SessionModelCopyWith<$R, $In, $Out> {
  @override
  $R call();
  SessionModelSignedOutCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SessionModelSignedOutCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, SessionModelSignedOut, $Out>
    implements SessionModelSignedOutCopyWith<$R, SessionModelSignedOut, $Out> {
  _SessionModelSignedOutCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SessionModelSignedOut> $mapper = SessionModelSignedOutMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  SessionModelSignedOut $make(CopyWithData data) => SessionModelSignedOut();

  @override
  SessionModelSignedOutCopyWith<$R2, SessionModelSignedOut, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SessionModelSignedOutCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
