import "package:flutter/material.dart";
import "package:j1_core_base/j1_core_base.dart";

class AromaBackButton extends StatelessWidget {
  const AromaBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return JIconButton(
      icon: JamIcons.chevron_left,
      color: JWidgetColor.secondary,
      onPressed: context.canPop() ? () => context.pop() : null,
    );
  }
}
