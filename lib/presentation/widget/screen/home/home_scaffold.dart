import "package:aroma_mobile/presentation/router.dart";
import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart" hide GoRouterHelper;
import "package:j1_core_base/j1_core_base.dart";

class HomeScaffold extends StatelessWidget {
  final StatefulNavigationShell shell;

  const HomeScaffold({
    required this.shell,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();

    return Scaffold(
      appBar: JAppBar(
        title: strings.app_title,
        titleStyle: context.textTheme().headlineLarge,
        trailingActions: [const _HomeSettingsButton()],
      ),
      body: shell,
      bottomNavigationBar: _HomeNavigationContainer(shell: shell),
    );
  }
}

class _HomeSettingsButton extends StatelessWidget {
  const _HomeSettingsButton();

  @override
  Widget build(BuildContext context) {
    return JIconButton(
      icon: JamIcons.settings,
      onPressed: () => context.push(AromaRoute.settings, const EmptyRouteConfig()),
    );
  }
}

class _HomeNavigationContainer extends StatelessWidget {
  final StatefulNavigationShell shell;

  const _HomeNavigationContainer({required this.shell});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.25),
            blurRadius: JDimens.size_4,
          ),
        ],
      ),
      child: _HomeNavigationBar(shell: shell),
    );
  }
}

class _HomeNavigationBar extends StatelessWidget {
  final StatefulNavigationShell shell;

  const _HomeNavigationBar({required this.shell});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings();
    final textTheme = context.textTheme();
    final colorScheme = context.colorScheme();

    // TODO: Update styling and icons.
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(JamIcons.unorderedlist),
          label: strings.feed_title,
        ),
        BottomNavigationBarItem(
          icon: Icon(JamIcons.book),
          label: strings.recipes_title,
        ),
        BottomNavigationBarItem(
          icon: Icon(JamIcons.account),
          label: strings.profile_title,
        ),
      ],
      currentIndex: shell.currentIndex,
      onTap: (index) => shell.goBranch(index, initialLocation: index == shell.currentIndex),
      elevation: JDimens.elevation_none,
      selectedItemColor: colorScheme.tertiary,
      unselectedItemColor: colorScheme.onSurface,
      selectedLabelStyle: textTheme.labelLarge,
      unselectedLabelStyle: textTheme.labelLarge,
    );
  }
}
