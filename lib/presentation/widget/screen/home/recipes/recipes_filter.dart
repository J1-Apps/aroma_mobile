import "package:aroma_mobile/presentation/util/extension/build_content_extensions.dart";
import "package:flutter/material.dart";
import "package:j1_core_base/j1_core_base.dart";

class RecipesFilter extends StatelessWidget {
  const RecipesFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: JDimens.spacing_xs,
      runSpacing: JDimens.spacing_xs,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _RecipesFilterDropdown(),
      ],
    );
  }
}

class _RecipesFilterDropdown extends StatelessWidget {
  const _RecipesFilterDropdown();

  @override
  Widget build(BuildContext context) {
    return JCard(
      size: JWidgetSize.small,
      // TODO: Show filter bottom sheet.
      onPressed: () => context.showJToastWithText(text: "Sort and filter", hasClose: true),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          JDimens.spacing_s,
          JDimens.spacing_xs,
          JDimens.spacing_xs,
          JDimens.spacing_xs,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.strings().recipes_sortFilterHint,
              style: context.textTheme().labelMedium,
            ),
            const SizedBox(width: JDimens.spacing_xxs),
            const Icon(
              JamIcons.chevrondown,
              size: JDimens.size_16,
            ),
          ],
        ),
      ),
    );
  }
}
