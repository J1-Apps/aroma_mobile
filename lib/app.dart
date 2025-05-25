import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:aroma_mobile/presentation/util/localization/app_localizations.dart";
import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/util/theme/aroma_theme.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:j1_theme/bloc/j1_theme_bloc.dart";
import "package:j1_theme/ui/ui.dart";

final _router = routeGraph.buildConfig();

class AromaApp extends StatelessWidget {
  const AromaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<J1ThemeBloc>(
          create: (_) =>
              J1ThemeBloc(defaultColorScheme: AromaColorScheme.light.scheme, defaultTextTheme: AromaTextTheme.initial),
        ),
      ],
      child: J1ThemeBuilder(
        builder: (context, theme) => MaterialApp.router(
          onGenerateTitle: (context) => context.strings().app_title,
          localizationsDelegates: Strings.localizationsDelegates,
          supportedLocales: Strings.supportedLocales,
          routerConfig: _router,
          theme: theme,
          // TODO: Add dynamic locale.
          locale: const Locale("en", "US"),
          scrollBehavior: ScrollConfiguration.of(context).copyWith(physics: AromaTheme.scrollPhysics),
        ),
      ),
    );
  }
}
