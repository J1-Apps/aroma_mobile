// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'recipe_model.dart';

class RecipeModelMapper extends ClassMapperBase<RecipeModel> {
  RecipeModelMapper._();

  static RecipeModelMapper? _instance;
  static RecipeModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipeModelMapper._());
      TagModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RecipeModel';

  static String _$id(RecipeModel v) => v.id;
  static const Field<RecipeModel, String> _f$id = Field('id', _$id);
  static String _$title(RecipeModel v) => v.title;
  static const Field<RecipeModel, String> _f$title = Field('title', _$title);
  static String _$imageUrl(RecipeModel v) => v.imageUrl;
  static const Field<RecipeModel, String> _f$imageUrl = Field('imageUrl', _$imageUrl);
  static int _$rating(RecipeModel v) => v.rating;
  static const Field<RecipeModel, int> _f$rating = Field('rating', _$rating);
  static int _$prepTime(RecipeModel v) => v.prepTime;
  static const Field<RecipeModel, int> _f$prepTime = Field('prepTime', _$prepTime);
  static int _$cookTime(RecipeModel v) => v.cookTime;
  static const Field<RecipeModel, int> _f$cookTime = Field('cookTime', _$cookTime);
  static int _$servings(RecipeModel v) => v.servings;
  static const Field<RecipeModel, int> _f$servings = Field('servings', _$servings);
  static int _$difficulty(RecipeModel v) => v.difficulty;
  static const Field<RecipeModel, int> _f$difficulty = Field('difficulty', _$difficulty);
  static List<TagModel> _$tags(RecipeModel v) => v.tags;
  static const Field<RecipeModel, List<TagModel>> _f$tags = Field('tags', _$tags);
  static String _$ingredientsRaw(RecipeModel v) => v.ingredientsRaw;
  static const Field<RecipeModel, String> _f$ingredientsRaw = Field('ingredientsRaw', _$ingredientsRaw);
  static String _$ingredientsJson(RecipeModel v) => v.ingredientsJson;
  static const Field<RecipeModel, String> _f$ingredientsJson = Field('ingredientsJson', _$ingredientsJson);
  static String _$directionsRaw(RecipeModel v) => v.directionsRaw;
  static const Field<RecipeModel, String> _f$directionsRaw = Field('directionsRaw', _$directionsRaw);
  static String _$directionsJson(RecipeModel v) => v.directionsJson;
  static const Field<RecipeModel, String> _f$directionsJson = Field('directionsJson', _$directionsJson);
  static String _$descriptionRaw(RecipeModel v) => v.descriptionRaw;
  static const Field<RecipeModel, String> _f$descriptionRaw = Field('descriptionRaw', _$descriptionRaw);
  static String _$descriptionJson(RecipeModel v) => v.descriptionJson;
  static const Field<RecipeModel, String> _f$descriptionJson = Field('descriptionJson', _$descriptionJson);
  static String _$notesRaw(RecipeModel v) => v.notesRaw;
  static const Field<RecipeModel, String> _f$notesRaw = Field('notesRaw', _$notesRaw);
  static String _$notesJson(RecipeModel v) => v.notesJson;
  static const Field<RecipeModel, String> _f$notesJson = Field('notesJson', _$notesJson);
  static String _$nutritionRaw(RecipeModel v) => v.nutritionRaw;
  static const Field<RecipeModel, String> _f$nutritionRaw = Field('nutritionRaw', _$nutritionRaw);
  static String _$nutritionJson(RecipeModel v) => v.nutritionJson;
  static const Field<RecipeModel, String> _f$nutritionJson = Field('nutritionJson', _$nutritionJson);
  static String _$sourceName(RecipeModel v) => v.sourceName;
  static const Field<RecipeModel, String> _f$sourceName = Field('sourceName', _$sourceName);
  static String _$sourceUrl(RecipeModel v) => v.sourceUrl;
  static const Field<RecipeModel, String> _f$sourceUrl = Field('sourceUrl', _$sourceUrl);

  @override
  final MappableFields<RecipeModel> fields = const {
    #id: _f$id,
    #title: _f$title,
    #imageUrl: _f$imageUrl,
    #rating: _f$rating,
    #prepTime: _f$prepTime,
    #cookTime: _f$cookTime,
    #servings: _f$servings,
    #difficulty: _f$difficulty,
    #tags: _f$tags,
    #ingredientsRaw: _f$ingredientsRaw,
    #ingredientsJson: _f$ingredientsJson,
    #directionsRaw: _f$directionsRaw,
    #directionsJson: _f$directionsJson,
    #descriptionRaw: _f$descriptionRaw,
    #descriptionJson: _f$descriptionJson,
    #notesRaw: _f$notesRaw,
    #notesJson: _f$notesJson,
    #nutritionRaw: _f$nutritionRaw,
    #nutritionJson: _f$nutritionJson,
    #sourceName: _f$sourceName,
    #sourceUrl: _f$sourceUrl,
  };

  static RecipeModel _instantiate(DecodingData data) {
    return RecipeModel(
      id: data.dec(_f$id),
      title: data.dec(_f$title),
      imageUrl: data.dec(_f$imageUrl),
      rating: data.dec(_f$rating),
      prepTime: data.dec(_f$prepTime),
      cookTime: data.dec(_f$cookTime),
      servings: data.dec(_f$servings),
      difficulty: data.dec(_f$difficulty),
      tags: data.dec(_f$tags),
      ingredientsRaw: data.dec(_f$ingredientsRaw),
      ingredientsJson: data.dec(_f$ingredientsJson),
      directionsRaw: data.dec(_f$directionsRaw),
      directionsJson: data.dec(_f$directionsJson),
      descriptionRaw: data.dec(_f$descriptionRaw),
      descriptionJson: data.dec(_f$descriptionJson),
      notesRaw: data.dec(_f$notesRaw),
      notesJson: data.dec(_f$notesJson),
      nutritionRaw: data.dec(_f$nutritionRaw),
      nutritionJson: data.dec(_f$nutritionJson),
      sourceName: data.dec(_f$sourceName),
      sourceUrl: data.dec(_f$sourceUrl),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RecipeModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipeModel>(map);
  }

  static RecipeModel fromJson(String json) {
    return ensureInitialized().decodeJson<RecipeModel>(json);
  }
}

mixin RecipeModelMappable {
  String toJson() {
    return RecipeModelMapper.ensureInitialized().encodeJson<RecipeModel>(this as RecipeModel);
  }

  Map<String, dynamic> toMap() {
    return RecipeModelMapper.ensureInitialized().encodeMap<RecipeModel>(this as RecipeModel);
  }

  RecipeModelCopyWith<RecipeModel, RecipeModel, RecipeModel> get copyWith =>
      _RecipeModelCopyWithImpl<RecipeModel, RecipeModel>(this as RecipeModel, $identity, $identity);
  @override
  String toString() {
    return RecipeModelMapper.ensureInitialized().stringifyValue(this as RecipeModel);
  }

  @override
  bool operator ==(Object other) {
    return RecipeModelMapper.ensureInitialized().equalsValue(this as RecipeModel, other);
  }

  @override
  int get hashCode {
    return RecipeModelMapper.ensureInitialized().hashValue(this as RecipeModel);
  }
}

extension RecipeModelValueCopy<$R, $Out> on ObjectCopyWith<$R, RecipeModel, $Out> {
  RecipeModelCopyWith<$R, RecipeModel, $Out> get $asRecipeModel =>
      $base.as((v, t, t2) => _RecipeModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipeModelCopyWith<$R, $In extends RecipeModel, $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, TagModel, TagModelCopyWith<$R, TagModel, TagModel>> get tags;
  $R call({
    String? id,
    String? title,
    String? imageUrl,
    int? rating,
    int? prepTime,
    int? cookTime,
    int? servings,
    int? difficulty,
    List<TagModel>? tags,
    String? ingredientsRaw,
    String? ingredientsJson,
    String? directionsRaw,
    String? directionsJson,
    String? descriptionRaw,
    String? descriptionJson,
    String? notesRaw,
    String? notesJson,
    String? nutritionRaw,
    String? nutritionJson,
    String? sourceName,
    String? sourceUrl,
  });
  RecipeModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipeModelCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RecipeModel, $Out>
    implements RecipeModelCopyWith<$R, RecipeModel, $Out> {
  _RecipeModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipeModel> $mapper = RecipeModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, TagModel, TagModelCopyWith<$R, TagModel, TagModel>> get tags =>
      ListCopyWith($value.tags, (v, t) => v.copyWith.$chain(t), (v) => call(tags: v));
  @override
  $R call({
    String? id,
    String? title,
    String? imageUrl,
    int? rating,
    int? prepTime,
    int? cookTime,
    int? servings,
    int? difficulty,
    List<TagModel>? tags,
    String? ingredientsRaw,
    String? ingredientsJson,
    String? directionsRaw,
    String? directionsJson,
    String? descriptionRaw,
    String? descriptionJson,
    String? notesRaw,
    String? notesJson,
    String? nutritionRaw,
    String? nutritionJson,
    String? sourceName,
    String? sourceUrl,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (title != null) #title: title,
      if (imageUrl != null) #imageUrl: imageUrl,
      if (rating != null) #rating: rating,
      if (prepTime != null) #prepTime: prepTime,
      if (cookTime != null) #cookTime: cookTime,
      if (servings != null) #servings: servings,
      if (difficulty != null) #difficulty: difficulty,
      if (tags != null) #tags: tags,
      if (ingredientsRaw != null) #ingredientsRaw: ingredientsRaw,
      if (ingredientsJson != null) #ingredientsJson: ingredientsJson,
      if (directionsRaw != null) #directionsRaw: directionsRaw,
      if (directionsJson != null) #directionsJson: directionsJson,
      if (descriptionRaw != null) #descriptionRaw: descriptionRaw,
      if (descriptionJson != null) #descriptionJson: descriptionJson,
      if (notesRaw != null) #notesRaw: notesRaw,
      if (notesJson != null) #notesJson: notesJson,
      if (nutritionRaw != null) #nutritionRaw: nutritionRaw,
      if (nutritionJson != null) #nutritionJson: nutritionJson,
      if (sourceName != null) #sourceName: sourceName,
      if (sourceUrl != null) #sourceUrl: sourceUrl,
    }),
  );
  @override
  RecipeModel $make(CopyWithData data) => RecipeModel(
    id: data.get(#id, or: $value.id),
    title: data.get(#title, or: $value.title),
    imageUrl: data.get(#imageUrl, or: $value.imageUrl),
    rating: data.get(#rating, or: $value.rating),
    prepTime: data.get(#prepTime, or: $value.prepTime),
    cookTime: data.get(#cookTime, or: $value.cookTime),
    servings: data.get(#servings, or: $value.servings),
    difficulty: data.get(#difficulty, or: $value.difficulty),
    tags: data.get(#tags, or: $value.tags),
    ingredientsRaw: data.get(#ingredientsRaw, or: $value.ingredientsRaw),
    ingredientsJson: data.get(#ingredientsJson, or: $value.ingredientsJson),
    directionsRaw: data.get(#directionsRaw, or: $value.directionsRaw),
    directionsJson: data.get(#directionsJson, or: $value.directionsJson),
    descriptionRaw: data.get(#descriptionRaw, or: $value.descriptionRaw),
    descriptionJson: data.get(#descriptionJson, or: $value.descriptionJson),
    notesRaw: data.get(#notesRaw, or: $value.notesRaw),
    notesJson: data.get(#notesJson, or: $value.notesJson),
    nutritionRaw: data.get(#nutritionRaw, or: $value.nutritionRaw),
    nutritionJson: data.get(#nutritionJson, or: $value.nutritionJson),
    sourceName: data.get(#sourceName, or: $value.sourceName),
    sourceUrl: data.get(#sourceUrl, or: $value.sourceUrl),
  );

  @override
  RecipeModelCopyWith<$R2, RecipeModel, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipeModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
