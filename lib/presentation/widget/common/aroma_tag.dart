import "package:flutter/material.dart";
import "package:j1_core_base/j1_core_base.dart";

class AromaTag extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool showClose;

  const AromaTag({
    required this.text,
    this.onPressed,
    this.showClose = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final padding = showClose
        ? const EdgeInsets.fromLTRB(
            JDimens.spacing_xs,
            JDimens.spacing_xxs,
            JDimens.spacing_xxs,
            JDimens.spacing_xxs,
          )
        : const EdgeInsets.symmetric(
            horizontal: JDimens.spacing_xs,
            vertical: JDimens.spacing_xxs,
          );

    return JCard(
      onPressed: onPressed,
      overrides: JCardOverrides(
        elevation: JDimens.elevation_none,
      ),
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: JDimens.spacing_xxxs,
          children: [
            Text(text, style: context.textTheme().labelMedium),
            if (showClose) const Icon(JamIcons.close, size: JDimens.size_16),
          ],
        ),
      ),
    );
  }
}
