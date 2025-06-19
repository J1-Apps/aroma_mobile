import "package:collection/collection.dart";
import "package:aroma_mobile/presentation/bloc/app/app_bloc.dart";
import "package:aroma_mobile/presentation/bloc/app/app_event.dart";
import "package:aroma_mobile/presentation/bloc/app/app_state.dart";
import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:aroma_mobile/presentation/util/localization/app_localizations.dart";
import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/util/theme/aroma_theme.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_core_base/j1_core_base.dart";

class AromaApp extends StatelessWidget {
  const AromaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<J1ThemeBloc>(
          create: (_) => J1ThemeBloc(
            defaultColorScheme: AromaColorScheme.light.scheme,
            defaultTextTheme: AromaTextTheme.initial,
          ),
        ),
        BlocProvider<AppBloc>(
          create: (_) => AppBloc()..add(const AppEventInit()),
        ),
      ],
      child: J1ThemeBuilder(
        builder: (context, theme) => BlocSelector<AppBloc, AppState, Locale?>(
          selector: (state) => Strings.supportedLocales.firstWhereOrNull(
            (locale) => locale.languageCode.toLowerCase() == state.language,
          ),
          builder: (context, locale) => _ThemeOverrides(
            child: MaterialApp.router(
              onGenerateTitle: (context) => context.strings().app_title,
              localizationsDelegates: Strings.localizationsDelegates,
              supportedLocales: Strings.supportedLocales,
              routerConfig: routeConfig,
              theme: theme,
              locale: locale,
              scrollBehavior: ScrollConfiguration.of(context).copyWith(physics: AromaTheme.scrollPhysics),
            ),
          ),
        ),
      ),
    );
  }
}

class _ThemeOverrides extends StatelessWidget {
  final Widget child;

  const _ThemeOverrides({required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme();

    return Theme(
      data: theme.copyWith(
        chipTheme: ChipThemeData(
          labelPadding: EdgeInsets.symmetric(horizontal: JDimens.spacing_xxs),
          padding: EdgeInsets.all(JDimens.spacing_xxs),
          labelStyle: theme.textTheme.bodyMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(JDimens.radius_m),
            side: BorderSide(color: theme.colorScheme.onSurface, width: 2),
          ),
        ),
      ),
      child: child,
    );
  }
}
