// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'router_state.dart';

class RouterStateMapper extends ClassMapperBase<RouterState> {
  RouterStateMapper._();

  static RouterStateMapper? _instance;
  static RouterStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RouterStateMapper._());
      AuthEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RouterState';

  static AuthEntity _$auth(RouterState v) => v.auth;
  static const Field<RouterState, AuthEntity> _f$auth = Field('auth', _$auth);

  @override
  final MappableFields<RouterState> fields = const {
    #auth: _f$auth,
  };

  static RouterState _instantiate(DecodingData data) {
    return RouterState(auth: data.dec(_f$auth));
  }

  @override
  final Function instantiate = _instantiate;

  static RouterState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RouterState>(map);
  }

  static RouterState fromJson(String json) {
    return ensureInitialized().decodeJson<RouterState>(json);
  }
}

mixin RouterStateMappable {
  String toJson() {
    return RouterStateMapper.ensureInitialized().encodeJson<RouterState>(this as RouterState);
  }

  Map<String, dynamic> toMap() {
    return RouterStateMapper.ensureInitialized().encodeMap<RouterState>(this as RouterState);
  }

  RouterStateCopyWith<RouterState, RouterState, RouterState> get copyWith =>
      _RouterStateCopyWithImpl<RouterState, RouterState>(this as RouterState, $identity, $identity);
  @override
  String toString() {
    return RouterStateMapper.ensureInitialized().stringifyValue(this as RouterState);
  }

  @override
  bool operator ==(Object other) {
    return RouterStateMapper.ensureInitialized().equalsValue(this as RouterState, other);
  }

  @override
  int get hashCode {
    return RouterStateMapper.ensureInitialized().hashValue(this as RouterState);
  }
}

extension RouterStateValueCopy<$R, $Out> on ObjectCopyWith<$R, RouterState, $Out> {
  RouterStateCopyWith<$R, RouterState, $Out> get $asRouterState =>
      $base.as((v, t, t2) => _RouterStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RouterStateCopyWith<$R, $In extends RouterState, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({AuthEntity? auth});
  RouterStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RouterStateCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RouterState, $Out>
    implements RouterStateCopyWith<$R, RouterState, $Out> {
  _RouterStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RouterState> $mapper = RouterStateMapper.ensureInitialized();
  @override
  $R call({AuthEntity? auth}) => $apply(FieldCopyWithData({if (auth != null) #auth: auth}));
  @override
  RouterState $make(CopyWithData data) => RouterState(auth: data.get(#auth, or: $value.auth));

  @override
  RouterStateCopyWith<$R2, RouterState, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RouterStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
