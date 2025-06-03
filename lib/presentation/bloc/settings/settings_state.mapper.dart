// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'settings_state.dart';

class SettingsStateMapper extends ClassMapperBase<SettingsState> {
  SettingsStateMapper._();

  static SettingsStateMapper? _instance;
  static SettingsStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SettingsStateMapper._());
      ErrorCodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SettingsState';

  static String? _$language(SettingsState v) => v.language;
  static const Field<SettingsState, String> _f$language = Field('language', _$language);
  static bool _$isSigningOut(SettingsState v) => v.isSigningOut;
  static const Field<SettingsState, bool> _f$isSigningOut = Field('isSigningOut', _$isSigningOut);
  static ErrorCode? _$error(SettingsState v) => v.error;
  static const Field<SettingsState, ErrorCode> _f$error = Field('error', _$error);

  @override
  final MappableFields<SettingsState> fields = const {
    #language: _f$language,
    #isSigningOut: _f$isSigningOut,
    #error: _f$error,
  };

  static SettingsState _instantiate(DecodingData data) {
    return SettingsState(
      language: data.dec(_f$language),
      isSigningOut: data.dec(_f$isSigningOut),
      error: data.dec(_f$error),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SettingsState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SettingsState>(map);
  }

  static SettingsState fromJson(String json) {
    return ensureInitialized().decodeJson<SettingsState>(json);
  }
}

mixin SettingsStateMappable {
  String toJson() {
    return SettingsStateMapper.ensureInitialized().encodeJson<SettingsState>(this as SettingsState);
  }

  Map<String, dynamic> toMap() {
    return SettingsStateMapper.ensureInitialized().encodeMap<SettingsState>(this as SettingsState);
  }

  SettingsStateCopyWith<SettingsState, SettingsState, SettingsState> get copyWith =>
      _SettingsStateCopyWithImpl<SettingsState, SettingsState>(this as SettingsState, $identity, $identity);
  @override
  String toString() {
    return SettingsStateMapper.ensureInitialized().stringifyValue(this as SettingsState);
  }

  @override
  bool operator ==(Object other) {
    return SettingsStateMapper.ensureInitialized().equalsValue(this as SettingsState, other);
  }

  @override
  int get hashCode {
    return SettingsStateMapper.ensureInitialized().hashValue(this as SettingsState);
  }
}

extension SettingsStateValueCopy<$R, $Out> on ObjectCopyWith<$R, SettingsState, $Out> {
  SettingsStateCopyWith<$R, SettingsState, $Out> get $asSettingsState =>
      $base.as((v, t, t2) => _SettingsStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SettingsStateCopyWith<$R, $In extends SettingsState, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? language, bool? isSigningOut, ErrorCode? error});
  SettingsStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SettingsStateCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, SettingsState, $Out>
    implements SettingsStateCopyWith<$R, SettingsState, $Out> {
  _SettingsStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SettingsState> $mapper = SettingsStateMapper.ensureInitialized();
  @override
  $R call({Object? language = $none, bool? isSigningOut, Object? error = $none}) => $apply(
    FieldCopyWithData({
      if (language != $none) #language: language,
      if (isSigningOut != null) #isSigningOut: isSigningOut,
      if (error != $none) #error: error,
    }),
  );
  @override
  SettingsState $make(CopyWithData data) => SettingsState(
    language: data.get(#language, or: $value.language),
    isSigningOut: data.get(#isSigningOut, or: $value.isSigningOut),
    error: data.get(#error, or: $value.error),
  );

  @override
  SettingsStateCopyWith<$R2, SettingsState, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SettingsStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
