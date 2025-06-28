import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/source/util/memory_data.dart";
import "package:aroma_mobile/domain/entity/tag_entity.dart";
import "package:aroma_mobile/domain/repository/tag_repository.dart";
import "package:aroma_mobile/domain/usecase/tag/tags_usecase.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";

void main() {
  group("Tags Usecase", () {
    final tagRepository = MockTagRepository();
    late TagsUsecase usecase;

    setUp(() {
      locator.registerSingleton<TagRepository>(tagRepository);
      usecase = TagsUsecaseImpl();
    });

    tearDown(() {
      locator.unregister<TagRepository>();
      reset(tagRepository);
    });

    test("calls repository with success", () async {
      when(() => tagRepository.getTags("query", 10)).thenAnswer(
        (_) async => Success(MockTags.all.take(10).map(TagEntity.fromModel).toList()),
      );
      final result = await usecase.call(query: "query");
      expect(result, MockTags.all.take(10).map(TagEntity.fromModel).toList());
      verify(() => tagRepository.getTags("query", 10)).called(1);
    });

    test("calls repository with failure", () async {
      when(() => tagRepository.getTags("query", 10)).thenAnswer(
        (_) async => Failure(ErrorModel(ErrorCode.repository_tag_getTagsFailed)),
      );
      final result = await usecase.call(query: "query");
      expect(result, []);
      verify(() => tagRepository.getTags("query", 10)).called(1);
    });
  });
}
