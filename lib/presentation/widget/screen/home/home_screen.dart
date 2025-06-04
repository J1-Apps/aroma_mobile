import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:flutter/material.dart";
import "package:j1_core_base/j1_core_base.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();

    return Scaffold(
      appBar: JAppBar(
        title: strings.app_title,
        titleStyle: context.textTheme().headlineLarge,
        trailingActions: [const _HomeSettingsButton()],
      ),
      body: Center(child: Text("Home")),
    );
  }
}

class _HomeSettingsButton extends StatelessWidget {
  const _HomeSettingsButton();

  @override
  Widget build(BuildContext context) {
    return JIconButton(
      icon: JamIcons.settings,
      onPressed: () => context.navigate(AromaRoute.settings.build(const EmptyRouteConfig())),
    );
  }
}
