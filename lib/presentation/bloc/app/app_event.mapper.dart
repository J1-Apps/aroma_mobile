// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'app_event.dart';

class AppEventMapper extends ClassMapperBase<AppEvent> {
  AppEventMapper._();

  static AppEventMapper? _instance;
  static AppEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppEventMapper._());
      AppEventInitMapper.ensureInitialized();
      AppEventAuthChangedMapper.ensureInitialized();
      AppEventLanguageChangedMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppEvent';

  @override
  final MappableFields<AppEvent> fields = const {};

  static AppEvent _instantiate(DecodingData data) {
    throw MapperException.missingSubclass('AppEvent', 'event', '${data.value['event']}');
  }

  @override
  final Function instantiate = _instantiate;

  static AppEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppEvent>(map);
  }

  static AppEvent fromJson(String json) {
    return ensureInitialized().decodeJson<AppEvent>(json);
  }
}

mixin AppEventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AppEventCopyWith<AppEvent, AppEvent, AppEvent> get copyWith;
}

abstract class AppEventCopyWith<$R, $In extends AppEvent, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  AppEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class AppEventInitMapper extends SubClassMapperBase<AppEventInit> {
  AppEventInitMapper._();

  static AppEventInitMapper? _instance;
  static AppEventInitMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppEventInitMapper._());
      AppEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'AppEventInit';

  @override
  final MappableFields<AppEventInit> fields = const {};

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "init";
  @override
  late final ClassMapperBase superMapper = AppEventMapper.ensureInitialized();

  static AppEventInit _instantiate(DecodingData data) {
    return AppEventInit();
  }

  @override
  final Function instantiate = _instantiate;

  static AppEventInit fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppEventInit>(map);
  }

  static AppEventInit fromJson(String json) {
    return ensureInitialized().decodeJson<AppEventInit>(json);
  }
}

mixin AppEventInitMappable {
  String toJson() {
    return AppEventInitMapper.ensureInitialized().encodeJson<AppEventInit>(this as AppEventInit);
  }

  Map<String, dynamic> toMap() {
    return AppEventInitMapper.ensureInitialized().encodeMap<AppEventInit>(this as AppEventInit);
  }

  AppEventInitCopyWith<AppEventInit, AppEventInit, AppEventInit> get copyWith =>
      _AppEventInitCopyWithImpl<AppEventInit, AppEventInit>(this as AppEventInit, $identity, $identity);
  @override
  String toString() {
    return AppEventInitMapper.ensureInitialized().stringifyValue(this as AppEventInit);
  }

  @override
  bool operator ==(Object other) {
    return AppEventInitMapper.ensureInitialized().equalsValue(this as AppEventInit, other);
  }

  @override
  int get hashCode {
    return AppEventInitMapper.ensureInitialized().hashValue(this as AppEventInit);
  }
}

extension AppEventInitValueCopy<$R, $Out> on ObjectCopyWith<$R, AppEventInit, $Out> {
  AppEventInitCopyWith<$R, AppEventInit, $Out> get $asAppEventInit =>
      $base.as((v, t, t2) => _AppEventInitCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AppEventInitCopyWith<$R, $In extends AppEventInit, $Out> implements AppEventCopyWith<$R, $In, $Out> {
  @override
  $R call();
  AppEventInitCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AppEventInitCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, AppEventInit, $Out>
    implements AppEventInitCopyWith<$R, AppEventInit, $Out> {
  _AppEventInitCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppEventInit> $mapper = AppEventInitMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  AppEventInit $make(CopyWithData data) => AppEventInit();

  @override
  AppEventInitCopyWith<$R2, AppEventInit, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AppEventInitCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AppEventAuthChangedMapper extends SubClassMapperBase<AppEventAuthChanged> {
  AppEventAuthChangedMapper._();

  static AppEventAuthChangedMapper? _instance;
  static AppEventAuthChangedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppEventAuthChangedMapper._());
      AppEventMapper.ensureInitialized().addSubMapper(_instance!);
      AuthEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppEventAuthChanged';

  static AuthEntity _$auth(AppEventAuthChanged v) => v.auth;
  static const Field<AppEventAuthChanged, AuthEntity> _f$auth = Field('auth', _$auth);

  @override
  final MappableFields<AppEventAuthChanged> fields = const {
    #auth: _f$auth,
  };

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "authChanged";
  @override
  late final ClassMapperBase superMapper = AppEventMapper.ensureInitialized();

  static AppEventAuthChanged _instantiate(DecodingData data) {
    return AppEventAuthChanged(data.dec(_f$auth));
  }

  @override
  final Function instantiate = _instantiate;

  static AppEventAuthChanged fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppEventAuthChanged>(map);
  }

  static AppEventAuthChanged fromJson(String json) {
    return ensureInitialized().decodeJson<AppEventAuthChanged>(json);
  }
}

mixin AppEventAuthChangedMappable {
  String toJson() {
    return AppEventAuthChangedMapper.ensureInitialized().encodeJson<AppEventAuthChanged>(this as AppEventAuthChanged);
  }

  Map<String, dynamic> toMap() {
    return AppEventAuthChangedMapper.ensureInitialized().encodeMap<AppEventAuthChanged>(this as AppEventAuthChanged);
  }

  AppEventAuthChangedCopyWith<AppEventAuthChanged, AppEventAuthChanged, AppEventAuthChanged> get copyWith =>
      _AppEventAuthChangedCopyWithImpl<AppEventAuthChanged, AppEventAuthChanged>(
        this as AppEventAuthChanged,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AppEventAuthChangedMapper.ensureInitialized().stringifyValue(this as AppEventAuthChanged);
  }

  @override
  bool operator ==(Object other) {
    return AppEventAuthChangedMapper.ensureInitialized().equalsValue(this as AppEventAuthChanged, other);
  }

  @override
  int get hashCode {
    return AppEventAuthChangedMapper.ensureInitialized().hashValue(this as AppEventAuthChanged);
  }
}

extension AppEventAuthChangedValueCopy<$R, $Out> on ObjectCopyWith<$R, AppEventAuthChanged, $Out> {
  AppEventAuthChangedCopyWith<$R, AppEventAuthChanged, $Out> get $asAppEventAuthChanged =>
      $base.as((v, t, t2) => _AppEventAuthChangedCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AppEventAuthChangedCopyWith<$R, $In extends AppEventAuthChanged, $Out>
    implements AppEventCopyWith<$R, $In, $Out> {
  @override
  $R call({AuthEntity? auth});
  AppEventAuthChangedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AppEventAuthChangedCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, AppEventAuthChanged, $Out>
    implements AppEventAuthChangedCopyWith<$R, AppEventAuthChanged, $Out> {
  _AppEventAuthChangedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppEventAuthChanged> $mapper = AppEventAuthChangedMapper.ensureInitialized();
  @override
  $R call({AuthEntity? auth}) => $apply(FieldCopyWithData({if (auth != null) #auth: auth}));
  @override
  AppEventAuthChanged $make(CopyWithData data) => AppEventAuthChanged(data.get(#auth, or: $value.auth));

  @override
  AppEventAuthChangedCopyWith<$R2, AppEventAuthChanged, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AppEventAuthChangedCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AppEventLanguageChangedMapper extends SubClassMapperBase<AppEventLanguageChanged> {
  AppEventLanguageChangedMapper._();

  static AppEventLanguageChangedMapper? _instance;
  static AppEventLanguageChangedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppEventLanguageChangedMapper._());
      AppEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'AppEventLanguageChanged';

  static String? _$language(AppEventLanguageChanged v) => v.language;
  static const Field<AppEventLanguageChanged, String> _f$language = Field('language', _$language);

  @override
  final MappableFields<AppEventLanguageChanged> fields = const {
    #language: _f$language,
  };

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "languageChanged";
  @override
  late final ClassMapperBase superMapper = AppEventMapper.ensureInitialized();

  static AppEventLanguageChanged _instantiate(DecodingData data) {
    return AppEventLanguageChanged(data.dec(_f$language));
  }

  @override
  final Function instantiate = _instantiate;

  static AppEventLanguageChanged fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppEventLanguageChanged>(map);
  }

  static AppEventLanguageChanged fromJson(String json) {
    return ensureInitialized().decodeJson<AppEventLanguageChanged>(json);
  }
}

mixin AppEventLanguageChangedMappable {
  String toJson() {
    return AppEventLanguageChangedMapper.ensureInitialized().encodeJson<AppEventLanguageChanged>(
      this as AppEventLanguageChanged,
    );
  }

  Map<String, dynamic> toMap() {
    return AppEventLanguageChangedMapper.ensureInitialized().encodeMap<AppEventLanguageChanged>(
      this as AppEventLanguageChanged,
    );
  }

  AppEventLanguageChangedCopyWith<AppEventLanguageChanged, AppEventLanguageChanged, AppEventLanguageChanged>
  get copyWith => _AppEventLanguageChangedCopyWithImpl<AppEventLanguageChanged, AppEventLanguageChanged>(
    this as AppEventLanguageChanged,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return AppEventLanguageChangedMapper.ensureInitialized().stringifyValue(this as AppEventLanguageChanged);
  }

  @override
  bool operator ==(Object other) {
    return AppEventLanguageChangedMapper.ensureInitialized().equalsValue(this as AppEventLanguageChanged, other);
  }

  @override
  int get hashCode {
    return AppEventLanguageChangedMapper.ensureInitialized().hashValue(this as AppEventLanguageChanged);
  }
}

extension AppEventLanguageChangedValueCopy<$R, $Out> on ObjectCopyWith<$R, AppEventLanguageChanged, $Out> {
  AppEventLanguageChangedCopyWith<$R, AppEventLanguageChanged, $Out> get $asAppEventLanguageChanged =>
      $base.as((v, t, t2) => _AppEventLanguageChangedCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AppEventLanguageChangedCopyWith<$R, $In extends AppEventLanguageChanged, $Out>
    implements AppEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? language});
  AppEventLanguageChangedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AppEventLanguageChangedCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, AppEventLanguageChanged, $Out>
    implements AppEventLanguageChangedCopyWith<$R, AppEventLanguageChanged, $Out> {
  _AppEventLanguageChangedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppEventLanguageChanged> $mapper = AppEventLanguageChangedMapper.ensureInitialized();
  @override
  $R call({Object? language = $none}) => $apply(FieldCopyWithData({if (language != $none) #language: language}));
  @override
  AppEventLanguageChanged $make(CopyWithData data) => AppEventLanguageChanged(data.get(#language, or: $value.language));

  @override
  AppEventLanguageChangedCopyWith<$R2, AppEventLanguageChanged, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AppEventLanguageChangedCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
