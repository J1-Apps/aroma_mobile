import "package:aroma_mobile/domain/repository/language_repository.dart";
import "package:aroma_mobile/domain/usecase/language/language_usecase.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";

void main() {
  group("Language Usecase", () {
    final languageRepository = MockLanguageRepository();
    late LanguageUsecase languageUsecase;

    setUpAll(() {
      locator.registerSingleton<LanguageRepository>(languageRepository);
    });

    setUp(() {
      languageUsecase = LanguageUsecaseImpl();
    });

    tearDown(() {
      reset(languageRepository);
    });

    tearDownAll(() async {
      await locator.reset();
    });

    test("returns a stream of language", () {
      when(() => languageRepository.languageStream).thenAnswer(
        (_) => Stream.fromIterable([
          "en",
          "en",
          "kr",
          "es",
        ]),
      );

      expect(languageUsecase.call(), emitsInOrder(["en", "en", "kr", "es"]));
    });
  });
}
