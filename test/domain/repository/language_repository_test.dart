import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/source/local_language_source/local_language_source.dart";
import "package:aroma_mobile/domain/repository/language_repository.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../test_util/testing_mocks.dart";

void main() {
  group("Language Repository", () {
    final localSource = MockLocalLanguageSource();
    late LanguageRepository repository;

    setUpAll(() {
      locator.registerSingleton<LocalLanguageSource>(localSource);
    });

    setUp(() {
      repository = LanguageRepositoryImpl();
    });

    tearDown(() {
      reset(localSource);
      repository.onDispose();
    });

    tearDownAll(() async {
      await locator.reset();
    });

    test("gets and updates language, handling errors", () async {
      expect(repository.languageStream, emitsInOrder(["en", "en", "kr", "es"]));

      when(localSource.getLanguage).thenThrow(const ErrorModel(ErrorCode.source_local_language_readError));
      await repository.loadLanguage();

      when(localSource.getLanguage).thenAnswer((_) => Future.value("en"));
      await repository.loadLanguage();

      when(() => localSource.updateLanguage(any())).thenThrow(
        const ErrorModel(ErrorCode.source_local_language_writeError),
      );
      await repository.updateLanguage("kr");

      when(() => localSource.updateLanguage(any())).thenAnswer((_) => Future.value());
      await repository.updateLanguage("es");

      verify(localSource.getLanguage).called(2);
      verify(() => localSource.updateLanguage(any())).called(2);
      repository.onDispose();
    });
  });
}
