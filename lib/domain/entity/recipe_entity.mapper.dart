// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'recipe_entity.dart';

class RecipeEntityMapper extends ClassMapperBase<RecipeEntity> {
  RecipeEntityMapper._();

  static RecipeEntityMapper? _instance;
  static RecipeEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipeEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RecipeEntity';

  static String _$id(RecipeEntity v) => v.id;
  static const Field<RecipeEntity, String> _f$id = Field('id', _$id);
  static String _$title(RecipeEntity v) => v.title;
  static const Field<RecipeEntity, String> _f$title = Field('title', _$title);
  static int _$prepTime(RecipeEntity v) => v.prepTime;
  static const Field<RecipeEntity, int> _f$prepTime = Field('prepTime', _$prepTime);
  static int _$cookTime(RecipeEntity v) => v.cookTime;
  static const Field<RecipeEntity, int> _f$cookTime = Field('cookTime', _$cookTime);
  static int _$servings(RecipeEntity v) => v.servings;
  static const Field<RecipeEntity, int> _f$servings = Field('servings', _$servings);
  static String _$imageUrl(RecipeEntity v) => v.imageUrl;
  static const Field<RecipeEntity, String> _f$imageUrl = Field('imageUrl', _$imageUrl);
  static int _$rating(RecipeEntity v) => v.rating;
  static const Field<RecipeEntity, int> _f$rating = Field('rating', _$rating);
  static int _$difficulty(RecipeEntity v) => v.difficulty;
  static const Field<RecipeEntity, int> _f$difficulty = Field('difficulty', _$difficulty);
  static String _$sourceName(RecipeEntity v) => v.sourceName;
  static const Field<RecipeEntity, String> _f$sourceName = Field('sourceName', _$sourceName);
  static String _$sourceUrl(RecipeEntity v) => v.sourceUrl;
  static const Field<RecipeEntity, String> _f$sourceUrl = Field('sourceUrl', _$sourceUrl);

  @override
  final MappableFields<RecipeEntity> fields = const {
    #id: _f$id,
    #title: _f$title,
    #prepTime: _f$prepTime,
    #cookTime: _f$cookTime,
    #servings: _f$servings,
    #imageUrl: _f$imageUrl,
    #rating: _f$rating,
    #difficulty: _f$difficulty,
    #sourceName: _f$sourceName,
    #sourceUrl: _f$sourceUrl,
  };

  static RecipeEntity _instantiate(DecodingData data) {
    return RecipeEntity(
      id: data.dec(_f$id),
      title: data.dec(_f$title),
      prepTime: data.dec(_f$prepTime),
      cookTime: data.dec(_f$cookTime),
      servings: data.dec(_f$servings),
      imageUrl: data.dec(_f$imageUrl),
      rating: data.dec(_f$rating),
      difficulty: data.dec(_f$difficulty),
      sourceName: data.dec(_f$sourceName),
      sourceUrl: data.dec(_f$sourceUrl),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RecipeEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipeEntity>(map);
  }

  static RecipeEntity fromJson(String json) {
    return ensureInitialized().decodeJson<RecipeEntity>(json);
  }
}

mixin RecipeEntityMappable {
  String toJson() {
    return RecipeEntityMapper.ensureInitialized().encodeJson<RecipeEntity>(this as RecipeEntity);
  }

  Map<String, dynamic> toMap() {
    return RecipeEntityMapper.ensureInitialized().encodeMap<RecipeEntity>(this as RecipeEntity);
  }

  RecipeEntityCopyWith<RecipeEntity, RecipeEntity, RecipeEntity> get copyWith =>
      _RecipeEntityCopyWithImpl<RecipeEntity, RecipeEntity>(this as RecipeEntity, $identity, $identity);
  @override
  String toString() {
    return RecipeEntityMapper.ensureInitialized().stringifyValue(this as RecipeEntity);
  }

  @override
  bool operator ==(Object other) {
    return RecipeEntityMapper.ensureInitialized().equalsValue(this as RecipeEntity, other);
  }

  @override
  int get hashCode {
    return RecipeEntityMapper.ensureInitialized().hashValue(this as RecipeEntity);
  }
}

extension RecipeEntityValueCopy<$R, $Out> on ObjectCopyWith<$R, RecipeEntity, $Out> {
  RecipeEntityCopyWith<$R, RecipeEntity, $Out> get $asRecipeEntity =>
      $base.as((v, t, t2) => _RecipeEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipeEntityCopyWith<$R, $In extends RecipeEntity, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? title,
    int? prepTime,
    int? cookTime,
    int? servings,
    String? imageUrl,
    int? rating,
    int? difficulty,
    String? sourceName,
    String? sourceUrl,
  });
  RecipeEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipeEntityCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RecipeEntity, $Out>
    implements RecipeEntityCopyWith<$R, RecipeEntity, $Out> {
  _RecipeEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipeEntity> $mapper = RecipeEntityMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    String? title,
    int? prepTime,
    int? cookTime,
    int? servings,
    String? imageUrl,
    int? rating,
    int? difficulty,
    String? sourceName,
    String? sourceUrl,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (title != null) #title: title,
      if (prepTime != null) #prepTime: prepTime,
      if (cookTime != null) #cookTime: cookTime,
      if (servings != null) #servings: servings,
      if (imageUrl != null) #imageUrl: imageUrl,
      if (rating != null) #rating: rating,
      if (difficulty != null) #difficulty: difficulty,
      if (sourceName != null) #sourceName: sourceName,
      if (sourceUrl != null) #sourceUrl: sourceUrl,
    }),
  );
  @override
  RecipeEntity $make(CopyWithData data) => RecipeEntity(
    id: data.get(#id, or: $value.id),
    title: data.get(#title, or: $value.title),
    prepTime: data.get(#prepTime, or: $value.prepTime),
    cookTime: data.get(#cookTime, or: $value.cookTime),
    servings: data.get(#servings, or: $value.servings),
    imageUrl: data.get(#imageUrl, or: $value.imageUrl),
    rating: data.get(#rating, or: $value.rating),
    difficulty: data.get(#difficulty, or: $value.difficulty),
    sourceName: data.get(#sourceName, or: $value.sourceName),
    sourceUrl: data.get(#sourceUrl, or: $value.sourceUrl),
  );

  @override
  RecipeEntityCopyWith<$R2, RecipeEntity, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipeEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
