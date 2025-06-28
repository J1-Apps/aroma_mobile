import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/data/source/local_language_source/local_language_source.dart";
import "package:get_it/get_it.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:rxdart/rxdart.dart";

abstract class LanguageRepository implements Disposable {
  Stream<String?> get languageStream;

  Future<Result<void>> loadLanguage({bool forceRefresh = false});
  Future<Result<void>> updateLanguage(String language);
}

class LanguageRepositoryImpl implements LanguageRepository {
  final LocalLanguageSource _localSource;
  final BehaviorSubject<String?> _languageSubject;

  @override
  Stream<String?> get languageStream => _languageSubject.stream;

  LanguageRepositoryImpl({
    LocalLanguageSource? localSource,
    String? initialState,
  }) : _localSource = localSource ?? locator.get<LocalLanguageSource>(),
       _languageSubject = BehaviorSubject.seeded(initialState);

  @override
  Future<Result<void>> loadLanguage({bool forceRefresh = false}) async {
    try {
      final language = await _localSource.getLanguage();
      _languageSubject.add(language);
      return const Success("");
    } catch (e) {
      return Failure(
        ErrorModel(
          ErrorCode.repository_language_loadFailed,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Result<void>> updateLanguage(String language) async {
    _languageSubject.add(language);

    try {
      await _localSource.updateLanguage(language);
      return const Success("");
    } catch (e) {
      return Failure(
        ErrorModel(
          ErrorCode.repository_language_updateFailed,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  void onDispose() {
    _languageSubject.close();
  }
}
