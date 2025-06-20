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
    }
    return _instance!;
  }

  @override
  final String id = 'RecipeModel';

  static String _$id(RecipeModel v) => v.id;
  static const Field<RecipeModel, String> _f$id = Field('id', _$id);
  static String _$title(RecipeModel v) => v.title;
  static const Field<RecipeModel, String> _f$title = Field('title', _$title);
  static String _$descriptionRaw(RecipeModel v) => v.descriptionRaw;
  static const Field<RecipeModel, String> _f$descriptionRaw = Field('descriptionRaw', _$descriptionRaw);
  static String _$descriptionJson(RecipeModel v) => v.descriptionJson;
  static const Field<RecipeModel, String> _f$descriptionJson = Field('descriptionJson', _$descriptionJson);
  static String _$ingredientsRaw(RecipeModel v) => v.ingredientsRaw;
  static const Field<RecipeModel, String> _f$ingredientsRaw = Field('ingredientsRaw', _$ingredientsRaw);
  static String _$ingredientsJson(RecipeModel v) => v.ingredientsJson;
  static const Field<RecipeModel, String> _f$ingredientsJson = Field('ingredientsJson', _$ingredientsJson);
  static String _$instructionsRaw(RecipeModel v) => v.instructionsRaw;
  static const Field<RecipeModel, String> _f$instructionsRaw = Field('instructionsRaw', _$instructionsRaw);
  static String _$instructionsJson(RecipeModel v) => v.instructionsJson;
  static const Field<RecipeModel, String> _f$instructionsJson = Field('instructionsJson', _$instructionsJson);
  static int _$prepTime(RecipeModel v) => v.prepTime;
  static const Field<RecipeModel, int> _f$prepTime = Field('prepTime', _$prepTime);
  static int _$cookTime(RecipeModel v) => v.cookTime;
  static const Field<RecipeModel, int> _f$cookTime = Field('cookTime', _$cookTime);
  static int _$servings(RecipeModel v) => v.servings;
  static const Field<RecipeModel, int> _f$servings = Field('servings', _$servings);
  static String _$imageUrl(RecipeModel v) => v.imageUrl;
  static const Field<RecipeModel, String> _f$imageUrl = Field('imageUrl', _$imageUrl);
  static int _$rating(RecipeModel v) => v.rating;
  static const Field<RecipeModel, int> _f$rating = Field('rating', _$rating);
  static int _$difficulty(RecipeModel v) => v.difficulty;
  static const Field<RecipeModel, int> _f$difficulty = Field('difficulty', _$difficulty);
  static String _$sourceName(RecipeModel v) => v.sourceName;
  static const Field<RecipeModel, String> _f$sourceName = Field('sourceName', _$sourceName);
  static String _$sourceUrl(RecipeModel v) => v.sourceUrl;
  static const Field<RecipeModel, String> _f$sourceUrl = Field('sourceUrl', _$sourceUrl);
  static String _$notesRaw(RecipeModel v) => v.notesRaw;
  static const Field<RecipeModel, String> _f$notesRaw = Field('notesRaw', _$notesRaw);
  static String _$notesJson(RecipeModel v) => v.notesJson;
  static const Field<RecipeModel, String> _f$notesJson = Field('notesJson', _$notesJson);

  @override
  final MappableFields<RecipeModel> fields = const {
    #id: _f$id,
    #title: _f$title,
    #descriptionRaw: _f$descriptionRaw,
    #descriptionJson: _f$descriptionJson,
    #ingredientsRaw: _f$ingredientsRaw,
    #ingredientsJson: _f$ingredientsJson,
    #instructionsRaw: _f$instructionsRaw,
    #instructionsJson: _f$instructionsJson,
    #prepTime: _f$prepTime,
    #cookTime: _f$cookTime,
    #servings: _f$servings,
    #imageUrl: _f$imageUrl,
    #rating: _f$rating,
    #difficulty: _f$difficulty,
    #sourceName: _f$sourceName,
    #sourceUrl: _f$sourceUrl,
    #notesRaw: _f$notesRaw,
    #notesJson: _f$notesJson,
  };

  static RecipeModel _instantiate(DecodingData data) {
    return RecipeModel(
      id: data.dec(_f$id),
      title: data.dec(_f$title),
      descriptionRaw: data.dec(_f$descriptionRaw),
      descriptionJson: data.dec(_f$descriptionJson),
      ingredientsRaw: data.dec(_f$ingredientsRaw),
      ingredientsJson: data.dec(_f$ingredientsJson),
      instructionsRaw: data.dec(_f$instructionsRaw),
      instructionsJson: data.dec(_f$instructionsJson),
      prepTime: data.dec(_f$prepTime),
      cookTime: data.dec(_f$cookTime),
      servings: data.dec(_f$servings),
      imageUrl: data.dec(_f$imageUrl),
      rating: data.dec(_f$rating),
      difficulty: data.dec(_f$difficulty),
      sourceName: data.dec(_f$sourceName),
      sourceUrl: data.dec(_f$sourceUrl),
      notesRaw: data.dec(_f$notesRaw),
      notesJson: data.dec(_f$notesJson),
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
  $R call({
    String? id,
    String? title,
    String? descriptionRaw,
    String? descriptionJson,
    String? ingredientsRaw,
    String? ingredientsJson,
    String? instructionsRaw,
    String? instructionsJson,
    int? prepTime,
    int? cookTime,
    int? servings,
    String? imageUrl,
    int? rating,
    int? difficulty,
    String? sourceName,
    String? sourceUrl,
    String? notesRaw,
    String? notesJson,
  });
  RecipeModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipeModelCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RecipeModel, $Out>
    implements RecipeModelCopyWith<$R, RecipeModel, $Out> {
  _RecipeModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipeModel> $mapper = RecipeModelMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    String? title,
    String? descriptionRaw,
    String? descriptionJson,
    String? ingredientsRaw,
    String? ingredientsJson,
    String? instructionsRaw,
    String? instructionsJson,
    int? prepTime,
    int? cookTime,
    int? servings,
    String? imageUrl,
    int? rating,
    int? difficulty,
    String? sourceName,
    String? sourceUrl,
    String? notesRaw,
    String? notesJson,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (title != null) #title: title,
      if (descriptionRaw != null) #descriptionRaw: descriptionRaw,
      if (descriptionJson != null) #descriptionJson: descriptionJson,
      if (ingredientsRaw != null) #ingredientsRaw: ingredientsRaw,
      if (ingredientsJson != null) #ingredientsJson: ingredientsJson,
      if (instructionsRaw != null) #instructionsRaw: instructionsRaw,
      if (instructionsJson != null) #instructionsJson: instructionsJson,
      if (prepTime != null) #prepTime: prepTime,
      if (cookTime != null) #cookTime: cookTime,
      if (servings != null) #servings: servings,
      if (imageUrl != null) #imageUrl: imageUrl,
      if (rating != null) #rating: rating,
      if (difficulty != null) #difficulty: difficulty,
      if (sourceName != null) #sourceName: sourceName,
      if (sourceUrl != null) #sourceUrl: sourceUrl,
      if (notesRaw != null) #notesRaw: notesRaw,
      if (notesJson != null) #notesJson: notesJson,
    }),
  );
  @override
  RecipeModel $make(CopyWithData data) => RecipeModel(
    id: data.get(#id, or: $value.id),
    title: data.get(#title, or: $value.title),
    descriptionRaw: data.get(#descriptionRaw, or: $value.descriptionRaw),
    descriptionJson: data.get(#descriptionJson, or: $value.descriptionJson),
    ingredientsRaw: data.get(#ingredientsRaw, or: $value.ingredientsRaw),
    ingredientsJson: data.get(#ingredientsJson, or: $value.ingredientsJson),
    instructionsRaw: data.get(#instructionsRaw, or: $value.instructionsRaw),
    instructionsJson: data.get(#instructionsJson, or: $value.instructionsJson),
    prepTime: data.get(#prepTime, or: $value.prepTime),
    cookTime: data.get(#cookTime, or: $value.cookTime),
    servings: data.get(#servings, or: $value.servings),
    imageUrl: data.get(#imageUrl, or: $value.imageUrl),
    rating: data.get(#rating, or: $value.rating),
    difficulty: data.get(#difficulty, or: $value.difficulty),
    sourceName: data.get(#sourceName, or: $value.sourceName),
    sourceUrl: data.get(#sourceUrl, or: $value.sourceUrl),
    notesRaw: data.get(#notesRaw, or: $value.notesRaw),
    notesJson: data.get(#notesJson, or: $value.notesJson),
  );

  @override
  RecipeModelCopyWith<$R2, RecipeModel, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipeModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
