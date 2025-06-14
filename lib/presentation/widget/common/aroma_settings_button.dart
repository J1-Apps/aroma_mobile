import "package:aroma_mobile/presentation/router.dart";
import "package:flutter/material.dart";
import "package:j1_core_base/j1_core_base.dart";

class AromaSettingsButton extends StatelessWidget {
  const AromaSettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return JIconButton(
      icon: JamIcons.settings,
      onPressed: () => context.push(AromaRoute.settings, const EmptyRouteConfig()),
    );
  }
}
