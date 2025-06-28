import "package:aroma_mobile/data/source/remote_tag_source/supabase_remote_tag_source.dart";
import "package:aroma_mobile/data/source/util/memory_data.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mock_supabase_http_client/mock_supabase_http_client.dart";
import "package:supabase_flutter/supabase_flutter.dart";

void main() {
  group("Supabase Remote Tag Source", () {
    late final SupabaseClient supabase;
    late final MockSupabaseHttpClient httpClient;
    late SupabaseRemoteTagSource source;

    setUpAll(() {
      httpClient = MockSupabaseHttpClient();
      supabase = SupabaseClient("mockUrl", "mockKey", httpClient: httpClient);
    });

    setUp(() {
      locator.registerSingleton<SupabaseClient>(supabase);
      source = SupabaseRemoteTagSource();
    });

    tearDown(() {
      locator.unregister<SupabaseClient>();
      httpClient.reset();
    });

    tearDownAll(() {
      httpClient.close();
    });

    test("gets tags", () async {
      await supabase.from("tags").insert(MockTags.dinner.toMap());
      await supabase.from("tags").insert(MockTags.lunch.toMap());
      await supabase.from("tags").insert(MockTags.breakfast.toMap());

      final tags = await source.getTags("", 10);
      expect(tags, const [MockTags.dinner, MockTags.lunch, MockTags.breakfast]);
    });
  });
}
