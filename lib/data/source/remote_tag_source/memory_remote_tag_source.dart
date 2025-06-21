import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/model/tag_model.dart";
import "package:aroma_mobile/data/source/remote_tag_source/remote_tag_source.dart";
import "package:aroma_mobile/data/source/util/memory_data.dart";
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
            ? MockTags.all.where((tag) => tag.name.toLowerCase().contains(query.toLowerCase())).toList()
            : MockTags.all;

        return filtered.take(limit).toList();
      }),
      ErrorCode.source_remote_tag_getTagsFailed,
    );
  }
}
