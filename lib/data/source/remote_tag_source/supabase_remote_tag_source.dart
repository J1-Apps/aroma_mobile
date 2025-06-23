import "package:aroma_mobile/data/model/tag_model.dart";
import "package:aroma_mobile/data/source/remote_tag_source/remote_tag_source.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:supabase_flutter/supabase_flutter.dart";

const _tagsTable = "tags";
const _nameColumn = "name";

// TODO: Order returned tags by most used/popular.
class SupabaseRemoteTagSource extends RemoteTagSource {
  final SupabaseClient _supabase;

  SupabaseRemoteTagSource({SupabaseClient? supabase}) : _supabase = supabase ?? locator<SupabaseClient>();

  @override
  Future<List<TagModel>> getTags(String query, int limit) async {
    final response = await _supabase.from(_tagsTable).select().ilike(_nameColumn, "%$query%").limit(limit);
    return response.map(TagModelMapper.fromMap).toList();
  }
}
