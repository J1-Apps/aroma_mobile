// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'recipe_card_details.dart';

class RecipeCardDetailsMapper extends ClassMapperBase<RecipeCardDetails> {
  RecipeCardDetailsMapper._();

  static RecipeCardDetailsMapper? _instance;
  static RecipeCardDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecipeCardDetailsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RecipeCardDetails';

  static String _$id(RecipeCardDetails v) => v.id;
  static const Field<RecipeCardDetails, String> _f$id = Field('id', _$id);
  static String _$title(RecipeCardDetails v) => v.title;
  static const Field<RecipeCardDetails, String> _f$title = Field('title', _$title);
  static String _$imageUrl(RecipeCardDetails v) => v.imageUrl;
  static const Field<RecipeCardDetails, String> _f$imageUrl = Field('imageUrl', _$imageUrl);
  static int _$totalTime(RecipeCardDetails v) => v.totalTime;
  static const Field<RecipeCardDetails, int> _f$totalTime = Field('totalTime', _$totalTime);
  static int _$servings(RecipeCardDetails v) => v.servings;
  static const Field<RecipeCardDetails, int> _f$servings = Field('servings', _$servings);

  @override
  final MappableFields<RecipeCardDetails> fields = const {
    #id: _f$id,
    #title: _f$title,
    #imageUrl: _f$imageUrl,
    #totalTime: _f$totalTime,
    #servings: _f$servings,
  };

  static RecipeCardDetails _instantiate(DecodingData data) {
    return RecipeCardDetails(
      id: data.dec(_f$id),
      title: data.dec(_f$title),
      imageUrl: data.dec(_f$imageUrl),
      totalTime: data.dec(_f$totalTime),
      servings: data.dec(_f$servings),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RecipeCardDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RecipeCardDetails>(map);
  }

  static RecipeCardDetails fromJson(String json) {
    return ensureInitialized().decodeJson<RecipeCardDetails>(json);
  }
}

mixin RecipeCardDetailsMappable {
  String toJson() {
    return RecipeCardDetailsMapper.ensureInitialized().encodeJson<RecipeCardDetails>(this as RecipeCardDetails);
  }

  Map<String, dynamic> toMap() {
    return RecipeCardDetailsMapper.ensureInitialized().encodeMap<RecipeCardDetails>(this as RecipeCardDetails);
  }

  RecipeCardDetailsCopyWith<RecipeCardDetails, RecipeCardDetails, RecipeCardDetails> get copyWith =>
      _RecipeCardDetailsCopyWithImpl<RecipeCardDetails, RecipeCardDetails>(
        this as RecipeCardDetails,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RecipeCardDetailsMapper.ensureInitialized().stringifyValue(this as RecipeCardDetails);
  }

  @override
  bool operator ==(Object other) {
    return RecipeCardDetailsMapper.ensureInitialized().equalsValue(this as RecipeCardDetails, other);
  }

  @override
  int get hashCode {
    return RecipeCardDetailsMapper.ensureInitialized().hashValue(this as RecipeCardDetails);
  }
}

extension RecipeCardDetailsValueCopy<$R, $Out> on ObjectCopyWith<$R, RecipeCardDetails, $Out> {
  RecipeCardDetailsCopyWith<$R, RecipeCardDetails, $Out> get $asRecipeCardDetails =>
      $base.as((v, t, t2) => _RecipeCardDetailsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecipeCardDetailsCopyWith<$R, $In extends RecipeCardDetails, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? title, String? imageUrl, int? totalTime, int? servings});
  RecipeCardDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecipeCardDetailsCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, RecipeCardDetails, $Out>
    implements RecipeCardDetailsCopyWith<$R, RecipeCardDetails, $Out> {
  _RecipeCardDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RecipeCardDetails> $mapper = RecipeCardDetailsMapper.ensureInitialized();
  @override
  $R call({String? id, String? title, String? imageUrl, int? totalTime, int? servings}) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (title != null) #title: title,
      if (imageUrl != null) #imageUrl: imageUrl,
      if (totalTime != null) #totalTime: totalTime,
      if (servings != null) #servings: servings,
    }),
  );
  @override
  RecipeCardDetails $make(CopyWithData data) => RecipeCardDetails(
    id: data.get(#id, or: $value.id),
    title: data.get(#title, or: $value.title),
    imageUrl: data.get(#imageUrl, or: $value.imageUrl),
    totalTime: data.get(#totalTime, or: $value.totalTime),
    servings: data.get(#servings, or: $value.servings),
  );

  @override
  RecipeCardDetailsCopyWith<$R2, RecipeCardDetails, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RecipeCardDetailsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
