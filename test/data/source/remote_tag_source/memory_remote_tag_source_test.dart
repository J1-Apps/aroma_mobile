import "package:aroma_mobile/data/source/remote_tag_source/memory_remote_tag_source.dart";
import "package:aroma_mobile/data/source/util/memory_data.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("Memory Remote Tag Source", () {
    late MemoryRemoteTagSource source;

    setUp(() {
      source = MemoryRemoteTagSource(initialMsDelay: 1);
    });

    test("gets tags with empty query", () async {
      final tags = await source.getTags("", 10);
      expect(tags, MockTags.all.getRange(0, 10).toList());
    });

    test("gets tags with populated query", () async {
      final tags = await source.getTags("an", 10);
      expect(tags, MockTags.all.where((tag) => tag.name.toLowerCase().contains("an")));
    });
  });
}
