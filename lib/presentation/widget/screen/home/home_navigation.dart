import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:flutter/material.dart";
import "package:j1_core_base/j1_core_base.dart";

class HomeNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) updateIndex;
  final Widget body;

  const HomeNavigation({
    required this.currentIndex,
    required this.updateIndex,
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: _HomeNavigationContainer(
        currentIndex: currentIndex,
        updateIndex: updateIndex,
      ),
    );
  }
}

class _HomeNavigationContainer extends StatelessWidget {
  final int currentIndex;
  final Function(int) updateIndex;

  const _HomeNavigationContainer({
    required this.currentIndex,
    required this.updateIndex,
  });

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
      child: _HomeNavigationBar(
        currentIndex: currentIndex,
        updateIndex: updateIndex,
      ),
    );
  }
}

class _HomeNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) updateIndex;

  const _HomeNavigationBar({
    required this.currentIndex,
    required this.updateIndex,
  });

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
      currentIndex: currentIndex,
      onTap: updateIndex,
      elevation: JDimens.elevation_none,
      selectedItemColor: colorScheme.tertiary,
      unselectedItemColor: colorScheme.onSurface,
      selectedLabelStyle: textTheme.labelLarge,
      unselectedLabelStyle: textTheme.labelLarge,
    );
  }
}
