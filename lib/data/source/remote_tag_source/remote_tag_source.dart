import "package:aroma_mobile/data/model/tag_model.dart";

abstract class RemoteTagSource {
  Future<List<TagModel>> getTags(String query, int limit);
}
