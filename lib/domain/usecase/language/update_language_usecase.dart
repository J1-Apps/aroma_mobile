import "package:aroma_mobile/domain/repository/language_repository.dart";
import "package:j1_core_base/j1_core_base.dart";

abstract class UpdateLanguageUsecase {
  Future<Result<void>> call(String language);
}

class UpdateLanguageUsecaseImpl implements UpdateLanguageUsecase {
  final LanguageRepository _languageRepository;

  UpdateLanguageUsecaseImpl({LanguageRepository? languageRepository})
    : _languageRepository = languageRepository ?? locator.get<LanguageRepository>();

  @override
  Future<Result<void>> call(String language) => _languageRepository.updateLanguage(language);
}
