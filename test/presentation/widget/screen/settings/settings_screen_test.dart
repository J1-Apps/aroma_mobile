import "dart:async";

import "package:aroma_mobile/data/model/error_model.dart";
import "package:aroma_mobile/presentation/bloc/settings/settings_bloc.dart";
import "package:aroma_mobile/presentation/bloc/settings/settings_event.dart";
import "package:aroma_mobile/presentation/bloc/settings/settings_state.dart";
import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/widget/screen/settings/settings_screen.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:j1_core_base/j1_core_base.dart";
import "package:mocktail/mocktail.dart";

import "../../../../test_util/test_wrapper.dart";
import "../../../../test_util/testing_mocks.dart";

void main() {
  group("Settings Screen", () {
    final router = MockRouter();
    final SettingsBloc bloc = MockSettingsBloc();
    final BuildContext context = FakeBuildContext();
    final SettingsEvent event = SettingsEventUpdateLanguage("en");
    late StreamController<SettingsState> stream;

    setUpAll(() {
      registerFallbackValue(context);
      registerFallbackValue(event);
      registerFallbackValue(FakeEmptyRoute());
      registerFallbackValue(const EmptyRouteConfig());
    });

    setUp(() {
      stream = StreamController<SettingsState>.broadcast();
      locator.registerSingleton<J1Router>(router);
      when(() => router.navigate<EmptyRouteConfig>(any(), any(), any())).thenAnswer((_) => Future.value());
      when(() => router.push<EmptyRouteConfig>(any(), any(), any())).thenAnswer((_) => Future.value());
      when(() => router.canPop(any())).thenReturn(true);
      when(bloc.close).thenAnswer((_) => Future.value());
      when(() => bloc.state).thenReturn(const SettingsState(language: "en", isSigningOut: false, error: null));
      when(() => bloc.stream).thenAnswer((_) => stream.stream);
    });

    tearDown(() {
      locator.unregister<J1Router>();
      reset(router);
      reset(bloc);
      stream.close();
    });

    testWidgets("handles error state", (tester) async {
      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const SettingsScreen(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsNothing);
      await tester.pumpAndSettle();

      stream.add(
        const SettingsState(
          language: "en",
          isSigningOut: false,
          error: ErrorCode.common_unknown,
        ),
      );
      await tester.pump(const Duration(milliseconds: 10));

      expect(find.byType(SnackBar), findsNothing);
      await tester.pumpAndSettle();

      stream.add(
        const SettingsState(
          language: "en",
          isSigningOut: false,
          error: ErrorCode.source_local_language_readError,
        ),
      );
      await tester.pump(const Duration(milliseconds: 10));

      expect(find.byType(SnackBar), findsOneWidget);
      await tester.pumpAndSettle();

      stream.add(
        const SettingsState(
          language: "en",
          isSigningOut: false,
          error: ErrorCode.source_local_language_writeError,
        ),
      );
      await tester.pump(const Duration(milliseconds: 10));

      expect(find.byType(SnackBar), findsOneWidget);
      await tester.pumpAndSettle();

      stream.add(
        const SettingsState(
          language: "en",
          isSigningOut: false,
          error: ErrorCode.source_remote_auth_signOutFailed,
        ),
      );
      await tester.pump(const Duration(milliseconds: 10));

      stream.add(
        const SettingsState(
          language: "en",
          isSigningOut: false,
          error: ErrorCode.source_remote_auth_signOutFailed,
        ),
      );
    });

    testWidgets("shows language loading indicator", (tester) async {
      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const SettingsScreen(),
        ),
      );
      stream.add(const SettingsState(language: null, isSigningOut: false, error: null));
      await tester.pump(const Duration(milliseconds: 10));

      expect(find.byType(JLoadingIndicator), findsOneWidget);
    });

    testWidgets("opens language drawer, filters, and selects", (tester) async {
      tester.view.physicalSize = const Size(720, 2000);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() => tester.view.resetPhysicalSize());
      addTearDown(() => tester.view.resetDevicePixelRatio());

      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const SettingsScreen(),
        ),
      );
      await tester.tap(find.byIcon(JamIcons.language));
      await tester.pumpAndSettle();

      final searchFinder = find.byType(JTextField);
      final cardFinder = find.byType(JCard);
      expect(searchFinder, findsOneWidget);
      expect(cardFinder, findsAtLeastNWidgets(1));

      await tester.enterText(searchFinder, "invalid filter");
      await tester.pumpAndSettle();

      expect(cardFinder, findsNothing);

      await tester.enterText(searchFinder, "");
      await tester.pumpAndSettle();

      await tester.tap(cardFinder.at(1));
      verify(() => bloc.add(any(that: isInstanceOf<SettingsEventUpdateLanguage>()))).called(1);
    });

    testWidgets("navigates to theme screen", (tester) async {
      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const SettingsScreen(),
        ),
      );
      stream.add(const SettingsState(language: "en", isSigningOut: false, error: null));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(JamIcons.chevron_right).at(0));
      await tester.pumpAndSettle();

      verify(() => router.push<EmptyRouteConfig>(any(), AromaRoute.theme, const EmptyRouteConfig())).called(1);
    });

    testWidgets("handles sign out", (tester) async {
      await tester.pumpWidget(
        TestWrapper(
          globalBloc: bloc,
          child: const SettingsScreen(),
        ),
      );
      stream.add(const SettingsState(language: "en", isSigningOut: false, error: null));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(JTextButton).at(0));
      await tester.pumpAndSettle();

      verify(() => bloc.add(const SettingsEventSignOut())).called(1);
    });
  });
}
