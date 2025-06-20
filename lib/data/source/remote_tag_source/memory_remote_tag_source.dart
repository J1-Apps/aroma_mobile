import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/model/tag_model.dart";
import "package:aroma_mobile/data/source/remote_tag_source/remote_tag_source.dart";
import "package:aroma_mobile/data/source/util/memory_source.dart";

class MemoryRemoteTagSource extends MemorySource implements RemoteTagSource {
  MemoryRemoteTagSource({
    super.initialShouldThrow,
    super.initialMsDelay,
  });

  @override
  Future<List<TagModel>> getTags(String query, int limit) async {
    return wrapRequest(
      Future.sync(() {
        final filtered = query.isNotEmpty
            ? _memoryTags.where((tag) => tag.name.toLowerCase().contains(query.toLowerCase())).toList()
            : _memoryTags;

        return filtered.take(limit).toList();
      }),
      ErrorCode.source_remote_tag_getTagsFailed,
    );
  }
}

const _memoryTags = [
  TagModel(id: 1, name: "Dinner"),
  TagModel(id: 2, name: "Lunch"),
  TagModel(id: 3, name: "Breakfast"),
  TagModel(id: 4, name: "Snack"),
  TagModel(id: 5, name: "Dessert"),
  TagModel(id: 6, name: "Asian"),
  TagModel(id: 7, name: "Italian"),
  TagModel(id: 8, name: "Mexican"),
  TagModel(id: 9, name: "Indian"),
  TagModel(id: 10, name: "French"),
  TagModel(id: 11, name: "Japanese"),
  TagModel(id: 12, name: "Korean"),
];
