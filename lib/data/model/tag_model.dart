import "package:dart_mappable/dart_mappable.dart";

part "tag_model.mapper.dart";

@MappableClass()
class TagModel with TagModelMappable {
  final int id;
  final String name;

  const TagModel({
    required this.id,
    required this.name,
  });
}
