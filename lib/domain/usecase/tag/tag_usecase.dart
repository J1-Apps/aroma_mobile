import "package:aroma_mobile/domain/entity/tag_entity.dart";
import "package:aroma_mobile/domain/repository/tag_repository.dart";
import "package:j1_core_base/j1_core_base.dart";

const _defaultLimit = 10;

abstract class TagUsecase {
  Future<List<TagEntity>> call({String? query, int limit = _defaultLimit});
}

class TagUsecaseImpl implements TagUsecase {
  final TagRepository _tagRepository;

  TagUsecaseImpl({TagRepository? tagRepository}) : _tagRepository = tagRepository ?? locator.get<TagRepository>();

  @override
  Future<List<TagEntity>> call({String? query, int limit = _defaultLimit}) async {
    final result = await _tagRepository.getTags(query ?? "", limit);

    return switch (result) {
      Success() => result.value,
      Failure() => [],
    };
  }
}
