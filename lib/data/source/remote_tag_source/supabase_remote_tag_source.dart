import "package:aroma_mobile/data/model/tag_model.dart";
import "package:aroma_mobile/data/source/remote_tag_source/remote_tag_source.dart";

// TODO: Implement this class.
class SupabaseRemoteTagSource extends RemoteTagSource {
  @override
  Future<List<TagModel>> getTags(String query, int limit) async {
    return [];
  }
}
