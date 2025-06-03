import "package:aroma_mobile/domain/repository/language_repository.dart";
import "package:j1_core_base/j1_core_base.dart";

abstract class LanguageUsecase {
  Stream<String?> call();
}

class LanguageUsecaseImpl implements LanguageUsecase {
  final LanguageRepository _languageRepository;

  LanguageUsecaseImpl({LanguageRepository? languageRepository})
    : _languageRepository = languageRepository ?? locator.get<LanguageRepository>();

  @override
  Stream<String?> call() => _languageRepository.languageStream;
}
