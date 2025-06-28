import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/source/remote_tag_source/remote_tag_source.dart";
import "package:aroma_mobile/data/source/util/memory_data.dart";
import "package:aroma_mobile/domain/entity/tag_entity.dart";
import "package:aroma_mobile/domain/repository/tag_repository.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../test_util/testing_mocks.dart";

void main() {
  group("Tag Repository", () {
    final remoteSource = MockRemoteTagSource();
    late TagRepository repository;

    setUp(() {
      locator.registerSingleton<RemoteTagSource>(remoteSource);
      repository = TagRepositoryImpl();
    });

    tearDown(() {
      locator.reset();
      reset(remoteSource);
    });

    test("returns tags when remote source succeeds", () async {
      when(() => remoteSource.getTags("query", 10)).thenAnswer(
        (_) async => MockTags.all.take(10).toList(),
      );

      final result = await repository.getTags("query", 10);

      expect(result, Success(MockTags.all.take(10).map(TagEntity.fromModel).toList()));
      verify(() => remoteSource.getTags("query", 10)).called(1);
    });

    test("should return error when remote source fails", () async {
      when(() => remoteSource.getTags("query", 10)).thenThrow(
        ErrorModel(ErrorCode.source_remote_tag_getTagsFailed),
      );

      final result = await repository.getTags("query", 10);

      expect(
        result,
        Failure<List<TagEntity>, Exception>(
          ErrorModel(
            ErrorCode.repository_tag_getTagsFailed,
            message: "ErrorModel(code: ErrorCode.source_remote_tag_getTagsFailed, message: )",
          ),
        ),
      );
      verify(() => remoteSource.getTags("query", 10)).called(1);
    });
  });
}
