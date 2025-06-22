import "package:aroma_mobile/data/source/remote_tag_source/supabase_remote_tag_source.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("Supabase Remote Tag Source", () {
    late SupabaseRemoteTagSource source;

    setUp(() {
      source = SupabaseRemoteTagSource();
    });

    test("gets tags", () async {
      final tags = await source.getTags("", 10);
      expect(tags, const []);
    });
  });
}
