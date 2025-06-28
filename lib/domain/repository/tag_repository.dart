import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/source/remote_tag_source/remote_tag_source.dart";
import "package:aroma_mobile/domain/entity/tag_entity.dart";
import "package:j1_core_base/j1_core_base.dart";

abstract class TagRepository {
  Future<Result<List<TagEntity>>> getTags(String query, int limit);
}

class TagRepositoryImpl implements TagRepository {
  final RemoteTagSource _remoteTagSource;

  TagRepositoryImpl({RemoteTagSource? remoteTagSource})
    : _remoteTagSource = remoteTagSource ?? locator.get<RemoteTagSource>();

  @override
  Future<Result<List<TagEntity>>> getTags(String query, int limit) async {
    try {
      final tags = await _remoteTagSource.getTags(query, limit);
      return Success(tags.map(TagEntity.fromModel).toList());
    } catch (e) {
      return Failure(ErrorModel(ErrorCode.repository_tag_getTagsFailed, message: e.toString()));
    }
  }
}
