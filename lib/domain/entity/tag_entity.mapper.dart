// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tag_entity.dart';

class TagEntityMapper extends ClassMapperBase<TagEntity> {
  TagEntityMapper._();

  static TagEntityMapper? _instance;
  static TagEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TagEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TagEntity';

  static int _$id(TagEntity v) => v.id;
  static const Field<TagEntity, int> _f$id = Field('id', _$id);
  static String _$name(TagEntity v) => v.name;
  static const Field<TagEntity, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<TagEntity> fields = const {
    #id: _f$id,
    #name: _f$name,
  };

  static TagEntity _instantiate(DecodingData data) {
    return TagEntity(id: data.dec(_f$id), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static TagEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TagEntity>(map);
  }

  static TagEntity fromJson(String json) {
    return ensureInitialized().decodeJson<TagEntity>(json);
  }
}

mixin TagEntityMappable {
  String toJson() {
    return TagEntityMapper.ensureInitialized().encodeJson<TagEntity>(this as TagEntity);
  }

  Map<String, dynamic> toMap() {
    return TagEntityMapper.ensureInitialized().encodeMap<TagEntity>(this as TagEntity);
  }

  TagEntityCopyWith<TagEntity, TagEntity, TagEntity> get copyWith =>
      _TagEntityCopyWithImpl<TagEntity, TagEntity>(this as TagEntity, $identity, $identity);
  @override
  String toString() {
    return TagEntityMapper.ensureInitialized().stringifyValue(this as TagEntity);
  }

  @override
  bool operator ==(Object other) {
    return TagEntityMapper.ensureInitialized().equalsValue(this as TagEntity, other);
  }

  @override
  int get hashCode {
    return TagEntityMapper.ensureInitialized().hashValue(this as TagEntity);
  }
}

extension TagEntityValueCopy<$R, $Out> on ObjectCopyWith<$R, TagEntity, $Out> {
  TagEntityCopyWith<$R, TagEntity, $Out> get $asTagEntity =>
      $base.as((v, t, t2) => _TagEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TagEntityCopyWith<$R, $In extends TagEntity, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name});
  TagEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TagEntityCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, TagEntity, $Out>
    implements TagEntityCopyWith<$R, TagEntity, $Out> {
  _TagEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TagEntity> $mapper = TagEntityMapper.ensureInitialized();
  @override
  $R call({int? id, String? name}) =>
      $apply(FieldCopyWithData({if (id != null) #id: id, if (name != null) #name: name}));
  @override
  TagEntity $make(CopyWithData data) => TagEntity(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
  );

  @override
  TagEntityCopyWith<$R2, TagEntity, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TagEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
