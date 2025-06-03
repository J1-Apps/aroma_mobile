import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/source/local_language_source/local_language_source.dart";
import "package:aroma_mobile/data/source/util/default.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:rxdart/rxdart.dart";

class LanguageRepository {
  final LocalLanguageSource _localSource;
  final BehaviorSubject<String> _languageSubject;

  Stream<String> get languageStream => _languageSubject.stream;

  LanguageRepository({
    LocalLanguageSource? localSource,
    String? initialState,
  }) : _localSource = localSource ?? locator.get<LocalLanguageSource>(),
       _languageSubject = BehaviorSubject.seeded(initialState ?? Default.language);

  Future<Result<void>> loadLanguage({bool forceRefresh = false}) async {
    try {
      final language = await _localSource.getLanguage();
      _languageSubject.add(language);
      return const Success("");
    } catch (e) {
      return Failure(
        ErrorModel(
          ErrorCode.source_local_language_readError,
          message: e.toString(),
        ),
      );
    }
  }

  Future<Result<void>> updateLanguage(String language) async {
    _languageSubject.add(language);

    try {
      await _localSource.updateLanguage(language);
      return const Success("");
    } catch (e) {
      return Failure(
        ErrorModel(
          ErrorCode.source_local_language_writeError,
          message: e.toString(),
        ),
      );
    }
  }

  void dispose() {
    _languageSubject.close();
  }
}
