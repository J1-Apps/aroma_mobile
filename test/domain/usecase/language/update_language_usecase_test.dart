import "package:aroma_mobile/domain/repository/language_repository.dart";
import "package:aroma_mobile/domain/usecase/language/update_language_usecase.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../test_util/testing_mocks.dart";

void main() {
  group("Update Language Usecase", () {
    final languageRepository = MockLanguageRepository();
    late UpdateLanguageUsecase updateLanguageUsecase;

    setUpAll(() {
      locator.registerSingleton<LanguageRepository>(languageRepository);
    });

    setUp(() {
      updateLanguageUsecase = UpdateLanguageUsecaseImpl();
    });

    tearDown(() {
      reset(languageRepository);
    });

    tearDownAll(() async {
      await locator.reset();
    });

    test("updates language", () async {
      when(() => languageRepository.updateLanguage(any())).thenAnswer((_) => Future.value(const Success("")));
      final result = await updateLanguageUsecase.call("kr");
      expect(result, isA<Success>());
    });
  });
}
