import "package:flutter/material.dart";
import "package:j1_core_base/j1_core_base.dart";

const _recipeCount = 8;

class RecipesPlaceholder extends StatelessWidget {
  const RecipesPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return JLoadingProvider(
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: JDimens.spacing_xs,
        crossAxisSpacing: JDimens.spacing_xs,
        padding: const EdgeInsets.all(JDimens.spacing_m),
        children: List.generate(_recipeCount, (_) => const _RecipePlaceholder()),
      ),
    );
  }
}

class _RecipePlaceholder extends StatelessWidget {
  const _RecipePlaceholder();

  @override
  Widget build(BuildContext context) {
    return JLoadingBox(
      cornerRadius: JDimens.radius_m,
    );
  }
}
