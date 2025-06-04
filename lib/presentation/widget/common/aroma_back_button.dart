import "package:flutter/material.dart";
import "package:j1_core_base/j1_core_base.dart";

class AromaBackButton extends StatelessWidget {
  const AromaBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return JIconButton(
      icon: JamIcons.chevronleft,
      color: JWidgetColor.secondary,
      onPressed: () {
        if (context.canPop()) {
          context.pop();
        }
      },
    );
  }
}
