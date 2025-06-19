// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'settings_event.dart';

class SettingsEventMapper extends ClassMapperBase<SettingsEvent> {
  SettingsEventMapper._();

  static SettingsEventMapper? _instance;
  static SettingsEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SettingsEventMapper._());
      SettingsEventInitMapper.ensureInitialized();
      SettingsEventUpdateLanguageMapper.ensureInitialized();
      SettingsEventLanguageUpdatedMapper.ensureInitialized();
      SettingsEventSignOutMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SettingsEvent';

  @override
  final MappableFields<SettingsEvent> fields = const {};

  static SettingsEvent _instantiate(DecodingData data) {
    throw MapperException.missingSubclass('SettingsEvent', 'event', '${data.value['event']}');
  }

  @override
  final Function instantiate = _instantiate;

  static SettingsEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SettingsEvent>(map);
  }

  static SettingsEvent fromJson(String json) {
    return ensureInitialized().decodeJson<SettingsEvent>(json);
  }
}

mixin SettingsEventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  SettingsEventCopyWith<SettingsEvent, SettingsEvent, SettingsEvent> get copyWith;
}

abstract class SettingsEventCopyWith<$R, $In extends SettingsEvent, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  SettingsEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class SettingsEventInitMapper extends SubClassMapperBase<SettingsEventInit> {
  SettingsEventInitMapper._();

  static SettingsEventInitMapper? _instance;
  static SettingsEventInitMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SettingsEventInitMapper._());
      SettingsEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'SettingsEventInit';

  @override
  final MappableFields<SettingsEventInit> fields = const {};

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "init";
  @override
  late final ClassMapperBase superMapper = SettingsEventMapper.ensureInitialized();

  static SettingsEventInit _instantiate(DecodingData data) {
    return SettingsEventInit();
  }

  @override
  final Function instantiate = _instantiate;

  static SettingsEventInit fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SettingsEventInit>(map);
  }

  static SettingsEventInit fromJson(String json) {
    return ensureInitialized().decodeJson<SettingsEventInit>(json);
  }
}

mixin SettingsEventInitMappable {
  String toJson() {
    return SettingsEventInitMapper.ensureInitialized().encodeJson<SettingsEventInit>(this as SettingsEventInit);
  }

  Map<String, dynamic> toMap() {
    return SettingsEventInitMapper.ensureInitialized().encodeMap<SettingsEventInit>(this as SettingsEventInit);
  }

  SettingsEventInitCopyWith<SettingsEventInit, SettingsEventInit, SettingsEventInit> get copyWith =>
      _SettingsEventInitCopyWithImpl<SettingsEventInit, SettingsEventInit>(
        this as SettingsEventInit,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SettingsEventInitMapper.ensureInitialized().stringifyValue(this as SettingsEventInit);
  }

  @override
  bool operator ==(Object other) {
    return SettingsEventInitMapper.ensureInitialized().equalsValue(this as SettingsEventInit, other);
  }

  @override
  int get hashCode {
    return SettingsEventInitMapper.ensureInitialized().hashValue(this as SettingsEventInit);
  }
}

extension SettingsEventInitValueCopy<$R, $Out> on ObjectCopyWith<$R, SettingsEventInit, $Out> {
  SettingsEventInitCopyWith<$R, SettingsEventInit, $Out> get $asSettingsEventInit =>
      $base.as((v, t, t2) => _SettingsEventInitCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SettingsEventInitCopyWith<$R, $In extends SettingsEventInit, $Out>
    implements SettingsEventCopyWith<$R, $In, $Out> {
  @override
  $R call();
  SettingsEventInitCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SettingsEventInitCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, SettingsEventInit, $Out>
    implements SettingsEventInitCopyWith<$R, SettingsEventInit, $Out> {
  _SettingsEventInitCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SettingsEventInit> $mapper = SettingsEventInitMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  SettingsEventInit $make(CopyWithData data) => SettingsEventInit();

  @override
  SettingsEventInitCopyWith<$R2, SettingsEventInit, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SettingsEventInitCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SettingsEventUpdateLanguageMapper extends SubClassMapperBase<SettingsEventUpdateLanguage> {
  SettingsEventUpdateLanguageMapper._();

  static SettingsEventUpdateLanguageMapper? _instance;
  static SettingsEventUpdateLanguageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SettingsEventUpdateLanguageMapper._());
      SettingsEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'SettingsEventUpdateLanguage';

  static String _$language(SettingsEventUpdateLanguage v) => v.language;
  static const Field<SettingsEventUpdateLanguage, String> _f$language = Field('language', _$language);

  @override
  final MappableFields<SettingsEventUpdateLanguage> fields = const {
    #language: _f$language,
  };

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "updateLanguage";
  @override
  late final ClassMapperBase superMapper = SettingsEventMapper.ensureInitialized();

  static SettingsEventUpdateLanguage _instantiate(DecodingData data) {
    return SettingsEventUpdateLanguage(data.dec(_f$language));
  }

  @override
  final Function instantiate = _instantiate;

  static SettingsEventUpdateLanguage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SettingsEventUpdateLanguage>(map);
  }

  static SettingsEventUpdateLanguage fromJson(String json) {
    return ensureInitialized().decodeJson<SettingsEventUpdateLanguage>(json);
  }
}

mixin SettingsEventUpdateLanguageMappable {
  String toJson() {
    return SettingsEventUpdateLanguageMapper.ensureInitialized().encodeJson<SettingsEventUpdateLanguage>(
      this as SettingsEventUpdateLanguage,
    );
  }

  Map<String, dynamic> toMap() {
    return SettingsEventUpdateLanguageMapper.ensureInitialized().encodeMap<SettingsEventUpdateLanguage>(
      this as SettingsEventUpdateLanguage,
    );
  }

  SettingsEventUpdateLanguageCopyWith<
    SettingsEventUpdateLanguage,
    SettingsEventUpdateLanguage,
    SettingsEventUpdateLanguage
  >
  get copyWith => _SettingsEventUpdateLanguageCopyWithImpl<SettingsEventUpdateLanguage, SettingsEventUpdateLanguage>(
    this as SettingsEventUpdateLanguage,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return SettingsEventUpdateLanguageMapper.ensureInitialized().stringifyValue(this as SettingsEventUpdateLanguage);
  }

  @override
  bool operator ==(Object other) {
    return SettingsEventUpdateLanguageMapper.ensureInitialized().equalsValue(
      this as SettingsEventUpdateLanguage,
      other,
    );
  }

  @override
  int get hashCode {
    return SettingsEventUpdateLanguageMapper.ensureInitialized().hashValue(this as SettingsEventUpdateLanguage);
  }
}

extension SettingsEventUpdateLanguageValueCopy<$R, $Out> on ObjectCopyWith<$R, SettingsEventUpdateLanguage, $Out> {
  SettingsEventUpdateLanguageCopyWith<$R, SettingsEventUpdateLanguage, $Out> get $asSettingsEventUpdateLanguage =>
      $base.as((v, t, t2) => _SettingsEventUpdateLanguageCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SettingsEventUpdateLanguageCopyWith<$R, $In extends SettingsEventUpdateLanguage, $Out>
    implements SettingsEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? language});
  SettingsEventUpdateLanguageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SettingsEventUpdateLanguageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SettingsEventUpdateLanguage, $Out>
    implements SettingsEventUpdateLanguageCopyWith<$R, SettingsEventUpdateLanguage, $Out> {
  _SettingsEventUpdateLanguageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SettingsEventUpdateLanguage> $mapper =
      SettingsEventUpdateLanguageMapper.ensureInitialized();
  @override
  $R call({String? language}) => $apply(FieldCopyWithData({if (language != null) #language: language}));
  @override
  SettingsEventUpdateLanguage $make(CopyWithData data) =>
      SettingsEventUpdateLanguage(data.get(#language, or: $value.language));

  @override
  SettingsEventUpdateLanguageCopyWith<$R2, SettingsEventUpdateLanguage, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SettingsEventUpdateLanguageCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SettingsEventLanguageUpdatedMapper extends SubClassMapperBase<SettingsEventLanguageUpdated> {
  SettingsEventLanguageUpdatedMapper._();

  static SettingsEventLanguageUpdatedMapper? _instance;
  static SettingsEventLanguageUpdatedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SettingsEventLanguageUpdatedMapper._());
      SettingsEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'SettingsEventLanguageUpdated';

  static String _$language(SettingsEventLanguageUpdated v) => v.language;
  static const Field<SettingsEventLanguageUpdated, String> _f$language = Field('language', _$language);

  @override
  final MappableFields<SettingsEventLanguageUpdated> fields = const {
    #language: _f$language,
  };

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "languageUpdated";
  @override
  late final ClassMapperBase superMapper = SettingsEventMapper.ensureInitialized();

  static SettingsEventLanguageUpdated _instantiate(DecodingData data) {
    return SettingsEventLanguageUpdated(data.dec(_f$language));
  }

  @override
  final Function instantiate = _instantiate;

  static SettingsEventLanguageUpdated fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SettingsEventLanguageUpdated>(map);
  }

  static SettingsEventLanguageUpdated fromJson(String json) {
    return ensureInitialized().decodeJson<SettingsEventLanguageUpdated>(json);
  }
}

mixin SettingsEventLanguageUpdatedMappable {
  String toJson() {
    return SettingsEventLanguageUpdatedMapper.ensureInitialized().encodeJson<SettingsEventLanguageUpdated>(
      this as SettingsEventLanguageUpdated,
    );
  }

  Map<String, dynamic> toMap() {
    return SettingsEventLanguageUpdatedMapper.ensureInitialized().encodeMap<SettingsEventLanguageUpdated>(
      this as SettingsEventLanguageUpdated,
    );
  }

  SettingsEventLanguageUpdatedCopyWith<
    SettingsEventLanguageUpdated,
    SettingsEventLanguageUpdated,
    SettingsEventLanguageUpdated
  >
  get copyWith => _SettingsEventLanguageUpdatedCopyWithImpl<SettingsEventLanguageUpdated, SettingsEventLanguageUpdated>(
    this as SettingsEventLanguageUpdated,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return SettingsEventLanguageUpdatedMapper.ensureInitialized().stringifyValue(this as SettingsEventLanguageUpdated);
  }

  @override
  bool operator ==(Object other) {
    return SettingsEventLanguageUpdatedMapper.ensureInitialized().equalsValue(
      this as SettingsEventLanguageUpdated,
      other,
    );
  }

  @override
  int get hashCode {
    return SettingsEventLanguageUpdatedMapper.ensureInitialized().hashValue(this as SettingsEventLanguageUpdated);
  }
}

extension SettingsEventLanguageUpdatedValueCopy<$R, $Out> on ObjectCopyWith<$R, SettingsEventLanguageUpdated, $Out> {
  SettingsEventLanguageUpdatedCopyWith<$R, SettingsEventLanguageUpdated, $Out> get $asSettingsEventLanguageUpdated =>
      $base.as((v, t, t2) => _SettingsEventLanguageUpdatedCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SettingsEventLanguageUpdatedCopyWith<$R, $In extends SettingsEventLanguageUpdated, $Out>
    implements SettingsEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? language});
  SettingsEventLanguageUpdatedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SettingsEventLanguageUpdatedCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SettingsEventLanguageUpdated, $Out>
    implements SettingsEventLanguageUpdatedCopyWith<$R, SettingsEventLanguageUpdated, $Out> {
  _SettingsEventLanguageUpdatedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SettingsEventLanguageUpdated> $mapper =
      SettingsEventLanguageUpdatedMapper.ensureInitialized();
  @override
  $R call({String? language}) => $apply(FieldCopyWithData({if (language != null) #language: language}));
  @override
  SettingsEventLanguageUpdated $make(CopyWithData data) =>
      SettingsEventLanguageUpdated(data.get(#language, or: $value.language));

  @override
  SettingsEventLanguageUpdatedCopyWith<$R2, SettingsEventLanguageUpdated, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SettingsEventLanguageUpdatedCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SettingsEventSignOutMapper extends SubClassMapperBase<SettingsEventSignOut> {
  SettingsEventSignOutMapper._();

  static SettingsEventSignOutMapper? _instance;
  static SettingsEventSignOutMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SettingsEventSignOutMapper._());
      SettingsEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'SettingsEventSignOut';

  @override
  final MappableFields<SettingsEventSignOut> fields = const {};

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = "signOut";
  @override
  late final ClassMapperBase superMapper = SettingsEventMapper.ensureInitialized();

  static SettingsEventSignOut _instantiate(DecodingData data) {
    return SettingsEventSignOut();
  }

  @override
  final Function instantiate = _instantiate;

  static SettingsEventSignOut fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SettingsEventSignOut>(map);
  }

  static SettingsEventSignOut fromJson(String json) {
    return ensureInitialized().decodeJson<SettingsEventSignOut>(json);
  }
}

mixin SettingsEventSignOutMappable {
  String toJson() {
    return SettingsEventSignOutMapper.ensureInitialized().encodeJson<SettingsEventSignOut>(
      this as SettingsEventSignOut,
    );
  }

  Map<String, dynamic> toMap() {
    return SettingsEventSignOutMapper.ensureInitialized().encodeMap<SettingsEventSignOut>(this as SettingsEventSignOut);
  }

  SettingsEventSignOutCopyWith<SettingsEventSignOut, SettingsEventSignOut, SettingsEventSignOut> get copyWith =>
      _SettingsEventSignOutCopyWithImpl<SettingsEventSignOut, SettingsEventSignOut>(
        this as SettingsEventSignOut,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SettingsEventSignOutMapper.ensureInitialized().stringifyValue(this as SettingsEventSignOut);
  }

  @override
  bool operator ==(Object other) {
    return SettingsEventSignOutMapper.ensureInitialized().equalsValue(this as SettingsEventSignOut, other);
  }

  @override
  int get hashCode {
    return SettingsEventSignOutMapper.ensureInitialized().hashValue(this as SettingsEventSignOut);
  }
}

extension SettingsEventSignOutValueCopy<$R, $Out> on ObjectCopyWith<$R, SettingsEventSignOut, $Out> {
  SettingsEventSignOutCopyWith<$R, SettingsEventSignOut, $Out> get $asSettingsEventSignOut =>
      $base.as((v, t, t2) => _SettingsEventSignOutCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SettingsEventSignOutCopyWith<$R, $In extends SettingsEventSignOut, $Out>
    implements SettingsEventCopyWith<$R, $In, $Out> {
  @override
  $R call();
  SettingsEventSignOutCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SettingsEventSignOutCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, SettingsEventSignOut, $Out>
    implements SettingsEventSignOutCopyWith<$R, SettingsEventSignOut, $Out> {
  _SettingsEventSignOutCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SettingsEventSignOut> $mapper = SettingsEventSignOutMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  SettingsEventSignOut $make(CopyWithData data) => SettingsEventSignOut();

  @override
  SettingsEventSignOutCopyWith<$R2, SettingsEventSignOut, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SettingsEventSignOutCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
