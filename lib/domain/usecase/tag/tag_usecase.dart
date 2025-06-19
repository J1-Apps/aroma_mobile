import "package:aroma_mobile/domain/entity/tag_entity.dart";

const _defaultLimit = 10;

abstract class TagUsecase {
  Future<List<TagEntity>> call({String? query, int limit = _defaultLimit});
}

// TODO: Remove this implementation and test the file.
// coverage:ignore-file
const _mockTags = [
  TagEntity(id: 1, name: "Dinner"),
  TagEntity(id: 2, name: "Lunch"),
  TagEntity(id: 3, name: "Breakfast"),
  TagEntity(id: 4, name: "Snack"),
  TagEntity(id: 5, name: "Dessert"),
  TagEntity(id: 6, name: "Asian"),
  TagEntity(id: 7, name: "Italian"),
  TagEntity(id: 8, name: "Mexican"),
  TagEntity(id: 9, name: "Indian"),
  TagEntity(id: 10, name: "French"),
  TagEntity(id: 11, name: "Japanese"),
  TagEntity(id: 12, name: "Korean"),
];

class TagUsecaseTestImpl implements TagUsecase {
  const TagUsecaseTestImpl();

  @override
  Future<List<TagEntity>> call({String? query, int limit = _defaultLimit}) async {
    await Future.delayed(const Duration(seconds: 1));

    final filtered = query != null
        ? _mockTags.where((tag) => tag.name.toLowerCase().contains(query.toLowerCase())).toList()
        : _mockTags;

    return filtered.take(limit).toList();
  }
}
