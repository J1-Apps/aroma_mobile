import "package:dart_mappable/dart_mappable.dart";

part "tag_entity.mapper.dart";

@MappableClass()
class TagEntity with TagEntityMappable {
  final int id;
  final String name;

  const TagEntity({
    required this.id,
    required this.name,
  });
}
