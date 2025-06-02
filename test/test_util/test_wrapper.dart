import "package:aroma_mobile/presentation/util/localization/app_localizations.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class TestWrapper<T extends Bloc> extends StatelessWidget {
  final Widget child;
  final T? globalBloc;

  const TestWrapper({required this.child, this.globalBloc, super.key});

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      locale: const Locale("en", "US"),
      localizationsDelegates: Strings.localizationsDelegates,
      supportedLocales: Strings.supportedLocales,
      home: Scaffold(body: child),
    );

    final bloc = globalBloc;
    return bloc == null ? app : BlocProvider<T>(create: (_) => bloc, child: app);
  }
}
