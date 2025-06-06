import "package:aroma_mobile/data/source/local_theme_source/local_theme_source.dart";
import "package:aroma_mobile/presentation/util/theme/aroma_theme.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:rxdart/subjects.dart";

class ThemeRepository extends J1ThemeRepository {
  final LocalThemeSource _localSource;
  final BehaviorSubject<J1ColorScheme> _colorSchemeSubject;
  final BehaviorSubject<J1TextTheme> _textThemeSubject;
  final BehaviorSubject<J1PageTransition> _pageTransitionSubject;

  ThemeRepository({
    LocalThemeSource? localSource,
    J1ColorScheme? initialColorScheme,
    J1TextTheme? initialTextTheme,
    J1PageTransition? initialPageTransition,
  }) : _localSource = localSource ?? locator.get<LocalThemeSource>(),
       _colorSchemeSubject = BehaviorSubject.seeded(initialColorScheme ?? AromaColorScheme.light.scheme),
       _textThemeSubject = BehaviorSubject.seeded(initialTextTheme ?? AromaTextTheme.initial),
       _pageTransitionSubject = BehaviorSubject.seeded(initialPageTransition ?? AromaTheme.pageTransition) {
    _loadColorScheme();
    _loadTextTheme();
    _loadPageTransition();
  }

  @override
  Stream<J1ColorScheme> getColorStream() {
    return _colorSchemeSubject.stream;
  }

  Future<void> _loadColorScheme() async {
    try {
      final colorScheme = await _localSource.getColorScheme();
      _colorSchemeSubject.add(colorScheme);
    } catch (_) {}
  }

  @override
  Future<void> setColorScheme(J1ColorScheme colorScheme) async {
    _colorSchemeSubject.add(colorScheme);

    try {
      await _localSource.updateColorScheme(colorScheme);
    } catch (_) {}
  }

  @override
  Stream<J1TextTheme> getTextStream() {
    return _textThemeSubject.stream;
  }

  Future<void> _loadTextTheme() async {
    try {
      final textTheme = await _localSource.getTextTheme();
      _textThemeSubject.add(textTheme);
    } catch (_) {}
  }

  @override
  Future<void> setTextTheme(J1TextTheme textTheme) async {
    _textThemeSubject.add(textTheme);

    try {
      await _localSource.updateTextTheme(textTheme);
    } catch (_) {}
  }

  @override
  Stream<J1PageTransition> getTransitionStream() {
    return _pageTransitionSubject.stream;
  }

  Future<void> _loadPageTransition() async {
    try {
      final pageTransition = await _localSource.getPageTransition();
      _pageTransitionSubject.add(pageTransition);
    } catch (_) {}
  }

  @override
  Future<void> setPageTransition(J1PageTransition pageTransition) async {
    _pageTransitionSubject.add(pageTransition);

    try {
      await _localSource.updatePageTransition(pageTransition);
    } catch (_) {}
  }

  void dispose() {
    _colorSchemeSubject.close();
    _textThemeSubject.close();
    _pageTransitionSubject.close();
  }
}
